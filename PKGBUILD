# Maintainer: Upslaught <upslaught at tuta dot io>

pkgname=ttf-ibm-plex-sans-jp
pkgver=3.0.0
pkgrel=1
pkgdesc="IBM Plex Sans for Japanese"
arch=('any')
url='https://github.com/IBM/plex'
license=('custom:OFL')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/%40ibm%2Fplex-sans-jp%40${pkgver}/ibm-plex-sans-jp.zip")
sha256sums=('4c14c41552934b0bc92fc216a76b36bdc78f745dfbeed1115f9b8bc405ee314f')

package() {
	cd ibm-plex-sans-jp
    install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"

    cd fonts/complete/ttf/hinted
    find -name "*.ttf" \
         -exec install -Dm644 {} -t "${pkgdir}/usr/share/fonts/TTF" \;
}
