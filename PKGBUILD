# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161

pkgname=notes-up
_pkgname=Notes-up
pkgver=2.0.0
pkgrel=1
pkgdesc="Notes Up is a notes manager written for elementary OS"
arch=('i686' 'x86_64')
url="https://github.com/Philip-Scott/Notes-up"
license=('GPL2')
depends=('gtk3' 'granite' 'gtksourceview3' 'glib2' 'sqlite' 'webkit2gtk' 'libgee' 'gtkspell3' 'discount')
makedepends=('cmake' 'gtksourceview3' 'vala')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/Philip-Scott/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('1a9bb7da0ddcbffd130d4ea8f879c4c8e43f35db531860c6b0ade49c99e619dbd96aa81e71e14af52908768bcc87a775afa97b04e7d1efd023326685c614f04b')

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
