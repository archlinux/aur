# Maintainer: danielpinto8zz6 <danielpinto8zz6@gmail.com>

pkgname=budgie-network-applet
pkgver=2.0
pkgrel=1
pkgdesc="Network applet for Budgie Desktop"
arch=('i686' 'x86_64')
license=('GPL2')
sha256sums=('12378120362d32894b047a57b00f9e9139c21640733d8ad90eea993998811fc2')
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
