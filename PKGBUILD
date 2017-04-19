# Maintainer: Zhanibek Adilbekov <zhanibek@archlinux.info>
pkgname=stoplight-desktop-bin
pkgver=3.1.1
pkgrel=1
pkgdesc="The Stoplight desktop app."
arch=('i686' 'x86_64')
url="https://stoplight.io/platform/scenarios/"
license=('unknown')
depends=('libxss' 'libappindicator-gtk2')
optdepends=()
provides=('stoplight-desktop-bin')
conflicts=()
options=('!emptydirs' '!strip')
install=${pkgname}.install
source_i686=("https://github.com/stoplightio/desktop/releases/download/v${pkgver}/Scenarios_${pkgver}_i386.deb")
source_x86_64=("https://github.com/stoplightio/desktop/releases/download/v${pkgver}/Scenarios_${pkgver}_amd64.deb")
sha256sums_i686=('67361cd78d56da9437658cff400274e77fe7e95e08d36403749bfa06849bbfe5')
sha256sums_x86_64=('e38461afc06daf0b6a950b8e7d8487122ca1e99130b31f07683833887cfd4414')

package() {
    cd "${pkgdir}"
    for I in `ls "${srcdir}" | grep '\.deb$'`; do
        ar x "${srcdir}/$I" data.tar.xz
        tar -xf data.tar.xz
        rm "${pkgdir}/data.tar.xz"
    done
}
