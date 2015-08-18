pkgname=vitables
pkgver=2.1
pkgrel=1
pkgdesc="A graphical tool for browsing and editing files in both PyTables and HDF5 formats."
url="http://vitables.org/"
depends=( 'python2' 'python2-pytables' 'python2-pyqt4' )
makedepends=( 'python2-sphinx' )
license=( 'GPL3' )
arch=( 'any' )
install=( "${pkgname}.install" )
source=( "http://downloads.sourceforge.net/project/vitables/ViTables-${pkgver}/ViTables-${pkgver}.tar.gz" )
md5sums=( '8aea53f86bcdfc28d215b3cfb6c437e9' )

build() {
    cd ${srcdir}/ViTables-${pkgver}
    python2 setup.py build
}

package() {
    cd ${srcdir}/ViTables-${pkgver}

    python2 setup.py install --root="${pkgdir}" --optimize=1 

    install -D -m 0644 "unixapp/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -D -m 0644 "unixapp/${pkgname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
}
