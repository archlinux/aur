# Maintainer: Popcorn <popcorn-public {at} protonmail {dot} com>

pkgname=arcint-gtk-theme
_pkgname=arcint-theme
pkgdesc="My own version of horst3180's Arc theme"
pkgver=20180928
pkgrel=3
provides=("arcint-gtk-theme")
conflicts=("arcint-gtk-theme-git")
arch=("any")
url="https://git.entrenix.xyz/Popcorn/arcint-theme"
license=("GPL3")
optdepends=("gnome-themes-standard: for gtk2 themes")
makedepends=("gtk3" "sassc" "optipng" "inkscape")
source=("${url}/archive/${pkgver}.tar.gz")
sha512sums=("f0cdb49ee3014deffd9a941aff2c339d87089c218ac1426e8711d967fb033821b9807ea421542bb7eba6d1c425ca1a7976591efc32bb703d06fd89df53e42dd9")

build() {
    cd ${_pkgname}
    ./autogen.sh --prefix=/usr
}

package() {
    make -C "${srcdir}/${_pkgname}" DESTDIR="${pkgdir}" install
}
