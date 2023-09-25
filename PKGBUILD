# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=complx
pkgver=4.20.0
pkgrel=1
pkgdesc="Complx: LC-3 Simulator used in GT:CS2110"
arch=('i686' 'x86_64')
url="https://www.github.com/TricksterGuy/complx"
license=('GPL')
depends=('gcc' 'wxwidgets-gtk3' 'boost' 'glib2' 'castxml' 'python-pygccxml' 'py++')
makedepends=('cmake')
source=(https://github.com/TricksterGuy/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('69fd19dd7adf937528118387e155b1908da362725d451f0cb99a07b802b66934')

build() {

    mkdir -p "${srcdir}/${pkgname}-${pkgver}/build"
    cd "${srcdir}/${pkgname}-${pkgver}/build"

    cmake .. \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        "${srcdir}/${pkgname}-${pkgver}"

    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/build"
    make DESTDIR="${pkgdir}/" install
}
