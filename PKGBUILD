# Maintainer: malacology <guoyi zhang at malacology dot net>

pkgname=graphite-gtk-theme
_pkgname='Graphite-gtk-theme'
_pkgver=2022-01-22
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
source=("https://github.com/vinceliuice/Graphite-gtk-theme/archive/refs/tags/${_pkgver}.zip")
sha256sums=('22d8a230358e61466977b1f7be9b440ed8d61c06d55d326ec7538ad9cc0fb714')


package() {
    dist="${pkgdir}/usr/share/themes"
    mkdir -p "${dist}"
    cd "${srcdir}/${_pkgname}-${_pkgver}"
    ./install.sh -t all -d "${dist}"
    ./install.sh -t all -d "${dist}" -s compact
}

