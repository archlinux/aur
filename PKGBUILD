# Maintainer: danielpinto8zz6 <danielpinto8zz6@gmail.com>

pkgname=budgie-network-applet
pkgver=2.2
pkgrel=1
pkgdesc="Network applet for Budgie Desktop"
arch=('i686' 'x86_64')
license=('GPL2')
sha256sums=('96439cf43cc22240307235e7b61403d8225eb57a519aa2e9d916da08162cca12')
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
