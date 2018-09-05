# Maintainer: POPCORNS <archlinux {at} protonmail {dot} com>

pkgname=arcint-gtk-theme-git
_pkgname=arcint-theme
pkgdesc="My own version of horst3180's Arc theme"
pkgver=1.0
pkgrel=1
arch=("any")
url="https://gitgud.io/popcorns/arcint-theme"
license=("GPL3")
optdepends=("gnome-themes-standard: for gtk2 themes")
makedepends=("git" "gtk3" "sassc" "optipng" "inkscape")

pkgver() {
    date +%Y%m%d
}

prepare() {
    git clone --depth 1 ${url}
}

build() {
    cd ${_pkgname}
    ./autogen.sh --prefix=/usr
}

package() {
    make -C "${srcdir}/${_pkgname}" DESTDIR="${pkgdir}" install
}
