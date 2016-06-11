# Maintainer: Alois Nespor <info@aloisnespor.info>

pkgname=ktoshiba
pkgver=5.3.1
pkgrel=1
pkgdesc="KToshiba is a Function (FN) key monitoring for Toshiba laptops."
arch=('i686' 'x86_64')
url="http://ktoshiba.sourceforge.net/"
license=('GPL2')
depends=(kcmutils)
makedepends=(cmake extra-cmake-modules )
source=("https://sourceforge.net/projects/ktoshiba/files/ktoshiba/5.3/ktoshiba-$pkgver.tar.xz")

build() {
msg "Starting build..."
   cd $srcdir/$pkgname-$pkgver
   cmake . -DCMAKE_INSTALL_PREFIX=/usr \
   -DKDE_INSTALL_LIBDIR=lib \
   -DLIBMNL_INCLUDE_DIRS=/usr/include/libmnl
   make 
}

package() {
  cd ${srcdir}/$pkgname-${pkgver}
    make "DESTDIR=$pkgdir" install
}
sha256sums=('6be3f114b7a5d94caf9b6b8b80a919d01eabc6fdff57f23533616ca0b36803b8')
