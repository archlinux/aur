# Maintainer: danielpinto8zz6 <danielpinto8zz6@gmail.com>

pkgname=budgie-calendar-applet
pkgver=4.0
pkgrel=1
pkgdesc="Calendar applet for Budgie Desktop"
arch=('i686' 'x86_64')
license=('GPL2')
sha256sums=('5f91c1ecf0c87801081ab862c2cd5d486b8b18a65c1d00bb505239f87d29a3fe')
depends=('libpeas' 'budgie-desktop') 
makedepends=('gobject-introspection' 'gnome-common' 'intltool' 'meson' 'ninja' 'itstool' 'vala')
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
