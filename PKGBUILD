# Maintainer: Popcorn <popcorn-public {at} protonmail {dot} com>

pkgname=arcint-gtk-theme
pkgdesc="My own version of horst3180's Arc theme"
pkgver=20190220
pkgrel=1
arch=("any")
provides=("arcint-gtk-theme")
conflicts=("arcint-gtk-theme-git")
url="https://gitgud.io/popcorn/arcint-gtk-theme"
license=("GPL3")
optdepends=("gnome-themes-standard: for gtk2 themes")
makedepends=("gtk3" "sassc" "optipng" "inkscape")
source=("${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=("7fd8ced53066a3570f5c047c0ad10107d11545d92cde78b6684796a05e82d2c5836572cdd231b73d7c62bf3feda611efde35c6b505367b8d764621de9398a317")

build() {
    "${pkgname}-${pkgver}/make.sh" --prefix="${srcdir}/build"
}

package() {
    mv "${srcdir}/build" "${pkgdir}/usr"
}
