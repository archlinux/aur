# Maintainer: Popcorn <popcorn-public {at} protonmail {dot} com>

pkgname=arcint-gtk-theme
pkgdesc="My own version of horst3180's Arc theme"
pkgver=20181125
pkgrel=1
arch=("any")
provides=("arcint-gtk-theme")
conflicts=("arcint-gtk-theme-git")
url="https://gitgud.io/popcorn/arcint-gtk-theme"
license=("GPL3")
optdepends=("gnome-themes-standard: for gtk2 themes")
makedepends=("gtk3" "sassc" "optipng" "inkscape")
source=("${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=("b2113abda1f960aa2a2bb64de80cf2ee8c90e235046573bf4fce3d75303859f73c3f35839a5279774242edf0aea6754449d699c730cb41d23ee94798d0e4de21")

build() {
    "${pkgname}-${pkgver}/make.sh" --prefix="${srcdir}/build"
}

package() {
    mv "${srcdir}/build" "${pkgdir}/usr"
}
