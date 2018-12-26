# Maintainer: Popcorn <popcorn-public {at} protonmail {dot} com>

pkgname=arcint-gtk-theme
pkgdesc="My own version of horst3180's Arc theme"
pkgver=20181226
pkgrel=1
arch=("any")
provides=("arcint-gtk-theme")
conflicts=("arcint-gtk-theme-git")
url="https://gitgud.io/popcorn/arcint-gtk-theme"
license=("GPL3")
optdepends=("gnome-themes-standard: for gtk2 themes")
makedepends=("gtk3" "sassc" "optipng" "inkscape")
source=("${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=("e12f20b2a4209b2b027e4e65f1d11b1ee58599b075f2cf2813bee56b4dc1a291ab86aafb4def3e1f48fc3bab45f49cce17c242d716c886bcf0a117b5125ca765")

build() {
    "${pkgname}-${pkgver}/make.sh" --prefix="${srcdir}/build"
}

package() {
    mv "${srcdir}/build" "${pkgdir}/usr"
}
