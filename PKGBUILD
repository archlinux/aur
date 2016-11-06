# Maintainer: Zhanibek Adilbekov <zhanibek@archlinux.info>
pkgname=stoplight-bin
pkgver=0.14.0
pkgrel=1
pkgdesc="A kickass API toolkit."
arch=('i686' 'x86_64')
url="http://stoplight.io/platform/design/"
license=('unknown')
depends=('libxss' 'libappindicator-gtk2')
optdepends=()
provides=('stoplight-bin')
conflicts=()
options=('!emptydirs' '!strip')
install=${pkgname}.install
source_i686=("https://github.com/stoplightio/stoplight-app/releases/download/v${pkgver}/Stoplight-${pkgver}-ia32.deb")
source_x86_64=("https://github.com/stoplightio/stoplight-app/releases/download/v${pkgver}/StopLight-${pkgver}-x64.deb")
sha256sums_i686=('bb8abd13159aa0995ad9b9d99e68626caae0b3ce394c228ae4d2573512e91afd')
sha256sums_x86_64=('a649bc14589c6b4329e3f9d5bb6af3ac08a804a7e32580ce6b2d4ebc2aa57975')

package() {
    cd "${pkgdir}"
    for I in `ls "${srcdir}" | grep '\.deb$'`; do
        ar x "${srcdir}/$I" data.tar.xz
        tar -xf data.tar.xz
        rm "${pkgdir}/data.tar.xz"
    done
}
