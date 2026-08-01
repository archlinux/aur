# Maintainer: Upslaught <upslaught at tuta dot io>

pkgname=ttf-ibm-plex-sans-tc
pkgver=1.1.0
pkgrel=1
pkgdesc="IBM Plex Sans for Traditional Chinese"
arch=('any')
url='https://github.com/IBM/plex'
license=('custom:OFL')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/%40ibm%2Fplex-sans-tc%40${pkgver}/ibm-plex-sans-tc.zip")
sha256sums=('b79600d3c9155fa05c9024eb81cfe2fbdd8cd068503dfafd79405ea577aa9fec')

package() {
	cd ibm-plex-sans-tc
    install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"

    cd fonts/complete/ttf/hinted
    find -name "*.ttf" \
         -exec install -Dm644 {} -t "${pkgdir}/usr/share/fonts/TTF" \;
}
