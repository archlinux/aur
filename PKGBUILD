# Maintainer: Aaron Fischer <mail@aaron-fischer.net>
# Contributor: Zachary Lund <admin@computerquip.com>
# Contributor: Edward Noname <edward.81@gmail.com>
# Contributor: Brett McGruddy <braxs69@gmail.com>
 
pkgname=libgaminggear
pkgver=0.15.1
pkgrel=5
pkgdesc="Provides functionality for gaming input devices"
arch=('i686' 'x86_64')
license=('GPL')
url="http://sourceforge.net/projects/libgaminggear/"
depends=('libnotify' 'libcanberra' 'gtk2' 'sqlite3>=3.7' 'python')
makedepends=('cmake>=3.0' 'doxygen')
source=(http://downloads.sourceforge.net/project/libgaminggear/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('ffbd59c62e3107b09ec99f1e5147529c61931987abc7f86a140449b46388c549')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cmake \
        -DINSTALL_CMAKE_MODULESDIR="/usr/share/cmake-3.13/Modules" \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DINSTALL_LIBDIR="/usr/lib"
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/"
    make DESTDIR=${pkgdir} install
}
