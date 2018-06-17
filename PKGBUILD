# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161

pkgname=notes-up
_pkgname=Notes-up
pkgver=1.5.2
pkgrel=1
pkgdesc="Notes Up is a notes manager written for elementary OS"
arch=('i686' 'x86_64')
url="https://github.com/Philip-Scott/Notes-up"
license=('GPL2')
depends=('gtk3' 'granite' 'gtksourceview3' 'glib2' 'sqlite' 'webkit2gtk' 'libgee' 'gtkspell3')
makedepends=('cmake' 'gtksourceview3' 'vala')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/Philip-Scott/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('504e189bb6b113dc0bc56b63defc79a50e0e750f2de49ae4a01aa84ba12c2780c99e0d2ff195b9b3997c9ca6e8316c7226582b844b52847cc5c425b363fb3d90')

build() {
    cd "${_pkgname}-${pkgver}"
    mkdir build -p
    cd build
    cmake -Dnoele=1 -DCMAKE_INSTALL_PREFIX=/usr ../
    make
}

package() {
    make -C "${_pkgname}-${pkgver}/build" DESTDIR="${pkgdir}" install
}
