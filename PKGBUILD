# Maintainer: Aaron Fischer <mail@aaron-fischer.net>
# Contributor: Zachary Lund <admin@computerquip.com>
# Contributor: Edward Noname <edward.81@gmail.com>
# Contributor: Brett McGruddy <braxs69@gmail.com>
 
pkgname=libgaminggear
pkgver=0.11.1
pkgrel=2
pkgdesc="Provides functionality for gaming input devices"
arch=('i686' 'x86_64')
license=('GPL')
url="http://sourceforge.net/projects/libgaminggear/"
depends=('libnotify' 'libcanberra' 'gtk2' 'sqlite3>=3.7')
makedepends=('cmake>=3.0' 'doxygen')
source=(http://downloads.sourceforge.net/project/libgaminggear/${pkgname}-${pkgver}.tar.bz2)
md5sums=('c789c6002d12ea072cc2464e0d33f425')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cmake \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DINSTALL_LIBDIR="/usr/lib"
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/"
    make DESTDIR=${pkgdir} install
}
