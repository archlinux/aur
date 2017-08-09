# Maintainer: NicoHood <aur {at} nicohood {dot} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161

pkgname=notes-up
_pkgname=Notes-up
pkgver=1.4.5
pkgrel=1
pkgdesc="Notes Up is a notes manager written for elementary OS"
arch=('i686' 'x86_64')
url="https://github.com/Philip-Scott/Notes-up"
license=('GPL2')
depends=('gtk3' 'granite' 'gtksourceview3' 'glib2' 'sqlite' 'webkit2gtk' 'libgee')
makedepends=('cmake' 'gtksourceview3' 'vala')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/Philip-Scott/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('0a07d9eed326cadecdb32987878e1cb1dd57d7a9591218fc5bffbd976662272001f6b111c73f0733e91af11cdcde516568314505d44ca7f815444026ac2ff9a2')

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
