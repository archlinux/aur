# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=complx
pkgver=4.19.1
pkgrel=1
pkgdesc="Complx: LC-3 Simulator used in GT:CS2110"
arch=('i686' 'x86_64')
url="https://www.github.com/TricksterGuy/complx"
license=('GPL')
depends=('gcc' 'wxgtk2' 'boost' 'glib2' 'castxml' 'python-pygccxml' 'py++')
makedepends=('cmake')
source=(https://github.com/TricksterGuy/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('815622fd92d50a79b46cc17a4d8091d86710456375af843914e633cf1a3fc6c4')

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
