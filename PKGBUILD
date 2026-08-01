# Maintainer: Upslaught <upslaught at tuta dot io>

pkgname=ttf-ibm-plex-sans-kr
pkgver=1.1.0
pkgrel=1
pkgdesc="IBM Plex Sans for Korean"
arch=('any')
url='https://github.com/IBM/plex'
license=('custom:OFL')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/%40ibm%2Fplex-sans-kr%40${pkgver}/ibm-plex-sans-kr.zip")
sha256sums=('9837800c8e5aedf4123775e1d767afa482c983321bd2fc606c985f405d24562e')

package() {
    cd ibm-plex-sans-kr/fonts/complete/ttf/hinted

    find -name "*.ttf" \
         -exec install -Dm644 {} -t "${pkgdir}/usr/share/fonts/TTF" \;

    install -Dm644 license.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
