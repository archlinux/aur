# Maintainer: Upslaught <upslaught at tuta dot io>

pkgname=ttf-ibm-plex-serif-only
pkgver=2.0.0
pkgrel=1
pkgdesc="IBM Plex Serif (no additional languages)"
arch=('any')
url='https://github.com/IBM/plex'
license=('custom:OFL')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/%40ibm%2Fplex-serif%40${pkgver}/ibm-plex-serif.zip")
sha256sums=('c006b095c47b919c6c8d78319e9e628745033f5db94507c1c9dfe4b35dd51f1e')

package() {
	cd ibm-plex-serif/fonts/complete/ttf

    find -name "*.ttf" \
         -exec install -Dm644 {} -t "${pkgdir}/usr/share/fonts/TTF" \;

    install -Dm644 license.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
