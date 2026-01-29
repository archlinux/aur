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
sha256sums=('fb22ae695ca0702a3309a6ed4ed49f4e5a24ba346f0196ce213ad4a217dd9f15')

package() {
    dist="${pkgdir}/usr/share/themes"
    mkdir -p "${dist}"
    cd "${srcdir}/${_pkgname}-${_pkgver}"
    ./install.sh -t all -d "${dist}"
    ./install.sh -t all -d "${dist}" -s compact
}

