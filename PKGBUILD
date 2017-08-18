# Maintainer: danielpinto8zz6 <danielpinto8zz6@gmail.com>

pkgname=budgie-calendar-applet
pkgver=4.0
pkgrel=1
pkgdesc="Calendar applet for Budgie Desktop"
arch=('i686' 'x86_64')
license=('GPL2')
sha256sums=('a0bc635ba86568b44cf84450877b7a05462ebb7d5e13ed99af48950011f70a74')
depends=('libpeas' 'budgie-desktop') 
makedepends=('gobject-introspection' 'meson' 'ninja' 'vala')
source=(https://github.com/danielpinto8zz6/${pkgname}/archive/${pkgver}.tar.gz)
url="https://github.com/danielpinto8zz6/${pkgname}"

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    mkdir -p build
    cd "${srcdir}/${pkgname}-${pkgver}/build"
    meson --prefix /usr --buildtype=plain ..
    ninja
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/build"
    DESTDIR="${pkgdir}" ninja install
}
