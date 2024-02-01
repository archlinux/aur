# Maintainer: arkorty <arkorty at gmail dot com>

pkgname=graphite-gtk-theme
_pkgname='Graphite-gtk-theme'
_pkgver=2023-12-31
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc='Graphite gtk theme'
arch=("any")
provides=("graphite-gtk-theme")
conflicts=("graphite-gtk-theme-git")
url="https://github.com/vinceliuice/${_pkgname}"
license=("GPL2")
depends=("gnome-themes-extra")
optdepends=("gtk-engine-murrine")
options=(!strip)
makedepends=("sassc")
source=("https://github.com/vinceliuice/Graphite-gtk-theme/archive/refs/tags/${_pkgver}.tar.gz")
sha256sums=('b21c3803d2c34928b2f05c6bc9e58995545e135de780ffffc143027b33df4bac')

package() {
    dist="${pkgdir}/usr/share/themes"
    mkdir -p "${dist}"
    cd "${srcdir}/${_pkgname}-${_pkgver}"
    ./install.sh -t all -d "${dist}"
    ./install.sh -t all -d "${dist}" -s compact
}

