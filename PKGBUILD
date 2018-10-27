# Maintainer: Popcorn <popcorn-public {at} protonmail {dot} com>

pkgname=arcint-gtk-theme
_pkgname=arcint-theme
pkgdesc="My own version of horst3180's Arc theme"
pkgver=20181027
pkgrel=1
provides=("arcint-gtk-theme")
conflicts=("arcint-gtk-theme-git")
arch=("any")
url="https://git.entrenix.xyz/Popcorn/arcint-theme"
license=("GPL3")
optdepends=("gnome-themes-standard: for gtk2 themes")
makedepends=("gtk3" "sassc" "optipng" "inkscape")
source=("${url}/archive/${pkgver}.tar.gz")
sha512sums=("64b3b377706d305bcbafff7271c66a539966170ba5895e3f15bdca7c341a2ca03eba6bc2ac03e93de9a3c5c430fe91f4eb24c607e6efd0d0915f503470e9b49f")

build() {
    cd ${_pkgname}
    ./autogen.sh --prefix=/usr
}

package() {
    make -C "${srcdir}/${_pkgname}" DESTDIR="${pkgdir}" install
}
