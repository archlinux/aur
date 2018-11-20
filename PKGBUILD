# Maintainer: Popcorn <popcorn-public {at} protonmail {dot} com>

pkgname=arcint-gtk-theme
_pkgname=arcint-theme
pkgdesc="My own version of horst3180's Arc theme"
pkgver=20181121
pkgrel=1
arch=("any")
provides=("arcint-gtk-theme")
conflicts=("arcint-gtk-theme-git")
url="https://gitgud.io/popcorn/arcint-theme"
license=("GPL3")
optdepends=("gnome-themes-standard: for gtk2 themes")
makedepends=("gtk3" "sassc" "optipng" "inkscape")
source=("${url}/-/archive/${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=("abdf298514c1ad80e90cca2d9235ba052f6f1a8ee15ab041c396e726e339aebd6c275d6856b5e7f5627420cafdd35ed30efd0a152a07a7d6321c6754bf3f72fa")

build() {
    cd "${_pkgname}-${pkgver}"
    ./autogen.sh --prefix=/usr
}

package() {
    make -C "${srcdir}/${_pkgname}-${pkgver}" DESTDIR="${pkgdir}" install
}
