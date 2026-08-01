# Maintainer: Upslaught <upslaught at tuta dot io>

pkgname=ttf-ibm-plex-sans-hebrew
pkgver=1.1.0
pkgrel=1
pkgdesc="IBM Plex Sans for Hebrew"
arch=('any')
url='https://github.com/IBM/plex'
license=('custom:OFL')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/%40ibm%2Fplex-sans-hebrew%40${pkgver}/ibm-plex-sans-hebrew.zip")
sha256sums=('d7d490b8a767b972a7f361055fdcf60ad7cb7c270b38ff1bf859562a021369fd')

package() {
	cd ibm-plex-sans-hebrew/fonts/complete/ttf

    find -name "*.ttf" \
         -exec install -Dm644 {} -t "${pkgdir}/usr/share/fonts/TTF" \;

	install -Dm644 license.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
