# Maintainer: Alexander Nicholi <me@nicholatian.com>
pkgname=grit
pkgver=0.9.2
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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/devkitPro/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b6f7f4441ed29adc33191e3d809358f57411e60514174cdec4cce728ef2091ce')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./autogen.sh
  ./configure
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dsm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
