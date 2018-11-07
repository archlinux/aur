# Maintainer: danielpinto8zz6 <danielpinto8zz6@gmail.com>

pkgname=budgie-calendar-applet
pkgver=5.2
pkgrel=1
pkgdesc="Calendar applet for Budgie Desktop"
arch=('i686' 'x86_64')
license=('GPL2')
sha256sums=('ce7c3d88dbdfd5026ce530c2c6647c7432dd51c4541c5d5fed7a08604383fb24')
depends=('libpeas' 'budgie-desktop') 
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
