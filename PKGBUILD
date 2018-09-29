# Maintainer: Popcorn <popcorn-public {at} protonmail {dot} com>

pkgname=arcint-gtk-theme
_pkgname=arcint-theme
pkgdesc="My own version of horst3180's Arc theme"
pkgver=20180930
pkgrel=1
provides=("arcint-gtk-theme")
conflicts=("arcint-gtk-theme-git")
arch=("any")
url="https://git.entrenix.xyz/Popcorn/arcint-theme"
license=("GPL3")
optdepends=("gnome-themes-standard: for gtk2 themes")
makedepends=("gtk3" "sassc" "optipng" "inkscape")
source=("${url}/archive/${pkgver}.tar.gz")
sha512sums=("d5d351bfe1d9ba83afd5a63c74c8f9528d4add6bd5c4bc633603faff16ae9e3e6202f21521e182ad0949a463f66b65e7104c460bd2005c51fafa4b26fc9a6694")

build() {
    cd ${_pkgname}
    ./autogen.sh --prefix=/usr
}

package() {
    make -C "${srcdir}/${_pkgname}" DESTDIR="${pkgdir}" install
}
