# Maintainer: danielpinto8zz6 <danielpinto8zz6@gmail.com>

pkgname=budgie-network-applet
pkgver=1.0
pkgrel=1
pkgdesc="Network applet for Budgie Desktop"
arch=('i686' 'x86_64')
license=('GPL2')
sha256sums=('beab85c6542ef4e98add32036f623fb30a3531cd8af54c9c9fced7ab49c01eb6')
depends=('libpeas' 'budgie-desktop' 'libnm' 'libnma' 'libgee') 
makedepends=('gobject-introspection' 'meson' 'ninja' 'vala')
source=(https://github.com/danielpinto8zz6/${pkgname}/archive/${pkgver}.tar.gz)
url="https://github.com/danielpinto8zz6/${pkgname}"

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    meson build --prefix /usr
    ninja -C build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    DESTDIR="${pkgdir}" ninja -C build install
}
