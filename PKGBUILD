# Maintainer: Zhanibek Adilbekov <zhanibek@archlinux.info>
pkgname=stoplight-bin
pkgver=0.15.3
pkgrel=1
pkgdesc="A kickass API toolkit."
arch=('x86_64')
url="http://stoplight.io/platform/design/"
license=('unknown')
depends=('libxss' 'libappindicator-gtk2')
optdepends=()
provides=('stoplight-bin')
conflicts=()
options=('!emptydirs' '!strip')
install=${pkgname}.install
source_x86_64=("https://github.com/stoplightio/stoplight-app/releases/download/v${pkgver}/Stoplight_${pkgver}_amd64.deb")
sha256sums_x86_64=('40a5b92d1d6de397da1301b77845959e05e2d5c460a8a10b07c42ec80eaaf8e5')

package() {
    cd "${pkgdir}"
    for I in `ls "${srcdir}" | grep '\.deb$'`; do
        ar x "${srcdir}/$I" data.tar.xz
        tar -xf data.tar.xz
        rm "${pkgdir}/data.tar.xz"
    done
}
