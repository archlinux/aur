# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=hactool
pkgver=1.4.0
pkgrel=1
pkgdesc="A tool to view information about common file formats for the Nintendo Switch"
arch=(x86_64)
url="https://github.com/SciresM/hactool"
license=("ISC")
source=("$pkgname-$pkgver.tar.gz::https://github.com/SciresM/hactool/archive/$pkgver.tar.gz")
b2sums=('8ab5a52c895fc295d342f1470a2c25a77b53c1b251683eae587d5930221f80228231d215ded99277d18951f616eb3a4bb95c45c08a98fe0e69d10bf5b4b0c05b')

prepare() {
  cd "$pkgname-$pkgver"
  cp config.mk.template config.mk
}

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  install -Dm755 -t "$pkgdir/usr/bin" "$pkgname-$pkgver/hactool"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgname-$pkgver/LICENSE"
}
