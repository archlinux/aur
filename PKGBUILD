# Maintainer : MorsMortium <morsmortium@disroot.org>

pkgname=appdir
pkgver=0.1.0
pkgrel=1
url="https://github.com/Forty-Bot/appdir"
pkgdesc="C library for finding platform-specific dirs"
arch=('x86_64')
license=('LGPL-3.0-or-later')
depends=('libxdg-basedir')
conflicts=('appdir')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Forty-Bot/appdir/archive/refs/tags/$pkgver.tar.gz")
sha1sums=('ec762349b307d857527dcd723d7aea818f4883c0')

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
