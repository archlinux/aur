# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=complx
pkgver=4.18.0
pkgrel=2
pkgdesc="Complx: LC-3 Simulator used in GT:CS2110"
arch=('i686' 'x86_64')
url="https://www.github.com/TricksterGuy/complx"
license=('GPL')
depends=('gcc' 'wxgtk' 'boost' 'glib2' 'castxml' 'pygccxml' 'py++')
makedepends=('cmake')
source=(https://github.com/TricksterGuy/${pkgname}/archive/${pkgver}.tar.gz)
md5sums=('6eced6c359145ba69e8508ce33d1254b')

build() {

    msg "Starting Cmake"

    # Create a build directory
    mkdir -p "${srcdir}/${pkgname}-${pkgver}/build"
    cd "${srcdir}/${pkgname}-${pkgver}/build"

    cmake .. \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        "${srcdir}/${pkgname}-${pkgver}"

    msg "Building the project"
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/build"

    msg "Installing files"
    make DESTDIR="${pkgdir}/" install
}
