# Maintainer: Upslaught <upslaught at tuta dot io>

pkgname=ttf-ibm-plex-sans-arabic
pkgver=1.1.0
pkgrel=1
pkgdesc="IBM Plex Sans for Arabic"
arch=('any')
url='https://github.com/IBM/plex'
license=('custom:OFL')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/%40ibm%2Fplex-sans-arabic%40${pkgver}/ibm-plex-sans-arabic.zip")
sha256sums=('f03915581aea37d82792c188b08064023a73494d679b8e19f85f5971db714013')

package() {
	cd ibm-plex-sans-arabic/fonts/complete/ttf

    find -name "*.ttf" \
         -exec install -Dm644 {} -t "${pkgdir}/usr/share/fonts/TTF" \;

    install -Dm644 license.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
