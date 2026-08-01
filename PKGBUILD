# Maintainer: Upslaught <upslaught at tuta dot io>

pkgname=ttf-ibm-plex-sans-only
pkgver=1.1.0
pkgrel=1
pkgdesc="IBM Plex Sans (no additional languages)"
arch=('any')
url='https://github.com/IBM/plex'
license=('custom:OFL')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/%40ibm%2Fplex-sans%40${pkgver}/ibm-plex-sans.zip")
sha256sums=('fb365d910566e6d199cc2c15579a7dd9a267128e18431a394ed81f1970c69200')

package() {
	cd ibm-plex-sans/fonts/complete/ttf

    find -name "*.ttf" \
         -exec install -Dm644 {} -t "${pkgdir}/usr/share/fonts/TTF" \;

    install -Dm644 license.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
