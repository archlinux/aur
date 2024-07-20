# Maintainer: Em Zhan <zqianem@gmail.com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Graziano Giuliani <giuliani@lamma.rete.toscana.it>

pkgname=wgrib2
pkgver=3.3.0
pkgrel=1
pkgdesc="Utility to read and write grib2 files"
arch=('x86_64')
url="https://github.com/NOAA-EMC/wgrib2"
license=('GPL' 'Apache' 'custom')
depends=('glibc' 'gcc-libs')
makedepends=('gcc-fortran' 'cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/NOAA-EMC/wgrib2/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('010827fba9c31f05807e02375240950927e9e51379e1444388153284f08f58e2')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake -B build
  cmake --build build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 build/wgrib2/wgrib2 "$pkgdir/usr/bin/$pkgname"
  install -Dm644 wgrib2/LICENSE-wgrib2 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
