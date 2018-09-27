# Maintainer: Popcorn <popcorn-public {at} protonmail {dot} com>

pkgname=arcint-gtk-theme
_pkgname=arcint-theme
pkgdesc="My own version of horst3180's Arc theme"
pkgver=20180928
pkgrel=2
provides=("arcint-gtk-theme")
conflicts=("arcint-gtk-theme-git")
arch=("any")
url="https://git.entrenix.xyz/Popcorn/arcint-theme"
license=("GPL3")
optdepends=("gnome-themes-standard: for gtk2 themes")
makedepends=("gtk3" "sassc" "optipng" "inkscape")
source=("${url}/archive/${pkgver}.tar.gz")
sha512sums=("eb08040a25138ee74aafbf722de1a5049944c3a6b03e40046351bbc9fcc7097d86afa7cd998e3c2e361c7099e476831669550d9fe5386715eeec297ce86d35e5")

build() {
    cd ${_pkgname}
    ./autogen.sh --prefix=/usr
}

package() {
    make -C "${srcdir}/${_pkgname}" DESTDIR="${pkgdir}" install
}
