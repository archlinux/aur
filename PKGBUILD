# Maintainer: Mambuco <gabriele.giambrone@icloud.com>

pkgname='graphite-gtk-theme'
_pkgname='Graphite-gtk-theme'
_pkgver='2024-07-15'
pkgver="${_pkgver//-/.}"
pkgrel='1'
pkgdesc='Graphite GTK Theme, by vinceliuice'
arch=('any')
provides=('graphite-gtk-theme')
conflicts=('graphite-gtk-theme-git')
url="https://github.com/vinceliuice/${_pkgname}"
license=('GPL-2.0-only')
optdepends=('gtk-engine-murrine')
options=(!strip)
makedepends=('sassc')
source=("$url/archive/refs/tags/${_pkgver}.tar.gz")
sha256sums=('b21c3803d2c34928b2f05c6bc9e58995545e135de780ffffc143027b33df4bac')

package() {
    dist="${pkgdir}/usr/share/themes"
    mkdir -p "${dist}"
    cd "${srcdir}/${_pkgname}-${_pkgver}"
    ./install.sh -t all -d "${dist}"
    ./install.sh -t all -d "${dist}" -s compact
}

