# Maintainer: willemw <willemw12@gmail.com>
# Contributor: T - rttommy@gmail.com

pkgname=rubix
pkgver=1.0.6
pkgrel=4
pkgdesc="Rubik's cube program"
arch=('x86_64')
url=http://sed.free.fr/rubix
license=('custom:Public Domain')
depends=(libx11)
optdepends=('xorg-fonts-misc: for extra fonts' 'xorg-mkfontscale: for extra fonts')
source=("$url/$pkgname-$pkgver.tar.bz2")
sha256sums=('ccff4c98373f76c6bab751f5f5a60df7ad8691c79b56157e4aba2dd76f501a87')

prepare() {
  sed -i 's/FONT = "7x13";/FONT = "6x13";/' $pkgname-$pkgver/main.c
}

build() {
  make -C $pkgname-$pkgver
}

package() {
  install -Dm755 $pkgname-$pkgver/rubix "$pkgdir/usr/bin/rubix"
}
