# Contributor: NicoHood <archlinux {cat} nicohood {dog} de>
# Maintainer: Matthew Sexton <wsdmatty (at) _gmail_ (dot) _com_>
# PGP ID: 97928FA059F8050487930EAFACF6C1A315EDCB52

pkgname=notes-up
_pkgname=Notes-up
pkgver=2.0.2
pkgrel=1
pkgdesc="Markdown style notes manager written for elementary OS"
arch=('i686' 'x86_64')
url="https://github.com/Philip-Scott/Notes-up"
license=('GPL2')
depends=('granite' 'gtksourceview3' 'webkit2gtk' 'gtkspell3' 'discount')
makedepends=('cmake' 'vala')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/Philip-Scott/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('071bf49ce970dabc815b79b768272efab4599ae0e496cc842b82b726d19bd645c7211d4ce9f56dda7cd6b77cad5ab4a1918ae9049fcec5bce6410929cc699dab')

build() {
    cd "${_pkgname}-${pkgver}"
    mkdir build
    cd build
    cmake -Dnoele=1 -DCMAKE_INSTALL_PREFIX=/usr ../
    make
}

package() {
    make -C "${_pkgname}-${pkgver}/build" DESTDIR="${pkgdir}" install
}
