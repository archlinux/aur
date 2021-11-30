# Maintainer: malacology <guoyi zhang at malacology dot net>

pkgname=graphite-gtk-theme
_pkgname='Graphite-gtk-theme'
_pkgver=2021-11-26
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
sha256sums=('c194bc114a12ee546ea926d7760864309b09818f7b51b064c1add9c55009b1ce')


package() {
    dist="${pkgdir}/usr/share/themes"
    mkdir -p "${dist}"
    cd "${srcdir}/${_pkgname}-${_pkgver}"
    ./install.sh -t all -d "${dist}"
    ./install.sh -t all -d "${dist}" -s compact
}

