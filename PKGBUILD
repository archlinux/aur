# Maintainer: Popcorn <popcorn-public {at} protonmail {dot} com>

pkgname=arcint-gtk-theme-git
_pkgname=arcint-gtk-theme
pkgdesc="My own version of horst3180's Arc theme"
pkgver=20181125
pkgrel=1
arch=("any")
provides=("arcint-gtk-theme")
conflicts=("arcint-gtk-theme")
url="https://gitgud.io/popcorn/arcint-gtk-theme"
license=("GPL3")
optdepends=("gnome-themes-standard: for gtk2 themes")
makedepends=("git" "gtk3" "sassc" "optipng" "inkscape")
source=("git+${url}.git")
sha512sums=("SKIP")

pkgver() {
    date +%Y%m%d
}

build() {
    "${_pkgname}/make.sh" --prefix="${srcdir}/build"
}

package() {
    mv "${srcdir}/build" "${pkgdir}/usr"
}
