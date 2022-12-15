# Maintainer : MorsMortium <morsmortium@gmail.com>

pkgname=appdir
pkgver=0.1.0
pkgrel=1
url="https://github.com/Forty-Bot/appdir"
pkgdesc="C library for finding platform-specific dirs"
arch=('any')
license=('LGPL3')
makedepends=('gcc' 'make' 'cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Forty-Bot/appdir/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('SKIP')

package() {
  cd $pkgname-$pkgver
  mkdir build
  cd build
  cmake ..
  make
  install -Dm 644 libappdir.so ${pkgdir}/usr/lib/libappdir.so
  install -Dm 644 ../include/appdir.h ${pkgdir}/usr/include/appdir/appdir.h
  install -Dm 644 include/appdir_export.h ${pkgdir}/usr/include/appdir/appdir_export.h
}
