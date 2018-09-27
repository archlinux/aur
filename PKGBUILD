# Maintainer: Popcorn <popcorn-public {at} protonmail {dot} com>

pkgname=arcint-gtk-theme
_pkgname=arcint-theme
pkgdesc="My own version of horst3180's Arc theme"
pkgver=20180928
pkgrel=1
provides=("arcint-gtk-theme")
conflicts=("arcint-gtk-theme-git")
arch=("any")
url="https://git.entrenix.xyz/Popcorn/arcint-theme"
license=("GPL3")
optdepends=("gnome-themes-standard: for gtk2 themes")
makedepends=("gtk3" "sassc" "optipng" "inkscape")
source=("${url}/archive/${pkgver}.tar.gz")
sha512sums=("0e399fe76694358fc0c30f9046910841f36a56c1800f7269c11b5983f299e547e94eadf807b8f6812e03e20a17fd2a983392700d533be73fde7e379664c08a86")

build() {
    cd ${_pkgname}
    ./autogen.sh --prefix=/usr
}

package() {
    make -C "${srcdir}/${_pkgname}" DESTDIR="${pkgdir}" install
}
