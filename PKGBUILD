# Maintainer: Aaron Fischer <mail@aaron-fischer.net>
# Contributor: Zachary Lund <admin@computerquip.com>

pkgname=libgaminggear
pkgver=0.10.1
pkgrel=1
pkgdesc="Provides functionality for gaming input devices"
arch=('i686' 'x86_64')
license=('GPL')
url="http://sourceforge.net/projects/libgaminggear/"
depends=('libnotify' 'libcanberra' 'gtk2' 'sqlite3>=3.7')
makedepends=('cmake>=3.0' 'doxygen')
source=(http://downloads.sourceforge.net/project/libgaminggear/${pkgname}-${pkgver}.tar.bz2)
md5sums=('c4d9f8204970180d89a61425f384cd4a')

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
