# Maintainer: Alexander Nicholi <me@nicholatian.com>
pkgname=grit
pkgver=0.8.17
pkgrel=1
epoch=
pkgdesc='Game Raster Image Transmogrifier'
arch=('i686' 'x86_64')
url="https://github.com/devkitPro/$pkgname"
license=('GPL-2.0')
depends=('freeimage')
makedepends=()
provides=("$pkgname")
conflicts=("$pkgname")
source=("https://github.com/devkitPro/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fa0da0f8dca64b7fa296b704eccc512ec84458b6b00935ce5d240951f041f534')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./autogen.sh
  ./configure
  make -j$(($(nproc) * 2))
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dsm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
