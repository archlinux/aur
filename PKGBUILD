# Maintainer: Mambuco <gabriele.giambrone@icloud.com>

pkgname='graphite-gtk-theme'
_pkgname='Graphite-gtk-theme'
_pkgver='2025-07-06'
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
sha256sums=('8aad3e38469047c715a75ac50d598d169c9ee05129d56b5b91f85357c98835c7')

package() {
    dist="${pkgdir}/usr/share/themes"
    mkdir -p "${dist}"
    cd "${srcdir}/${_pkgname}-${_pkgver}"
    ./install.sh -t all -d "${dist}"
    ./install.sh -t all -d "${dist}" -s compact
}

