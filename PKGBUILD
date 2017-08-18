# Maintainer: danielpinto8zz6 <danielpinto8zz6@gmail.com>

pkgname=budgie-calendar-applet
pkgver=4.0
pkgrel=1
pkgdesc="Calendar applet for Budgie Desktop"
arch=('i686' 'x86_64')
license=('GPL2')
sha256sums=('6a9f2a7da37cb293606ac3e876bc10c6b75e9d88080a738e31695699ca75bf80')
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
