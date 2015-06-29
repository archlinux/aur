# Maintainer: Aaron Fischer <mail@aaron-fischer.net>
# Contributor: Zachary Lund <admin@computerquip.com>

pkgname=libgaminggear
pkgver=0.9.0
pkgrel=1
pkgdesc="Provides functionality for gaming input devices"
arch=('i686' 'x86_64')
license=('GPL')
url="http://sourceforge.net/projects/libgaminggear/"
depends=('libnotify' 'libcanberra' 'gtk2' 'sqlite3>=3.7')
makedepends=('cmake>=3.0' 'doxygen')
source=(http://downloads.sourceforge.net/project/libgaminggear/${pkgname}-${pkgver}.tar.bz2)
md5sums=('6494d8bc1da72f297099793f3f55e608')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake \
	-DCMAKE_INSTALL_PREFIX="/usr" \
	-DINSTALL_LIBDIR="/usr/lib" \
	-DINSTALL_CMAKE_MODULESDIR="/usr/share/cmake-3.2/Modules"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  make DESTDIR=${pkgdir} install
}
