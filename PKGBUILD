# Maintainer: Upslaught <upslaught at tuta dot io>

pkgname=ttf-ibm-plex-sans-devanagari
pkgver=1.1.0
pkgrel=1
pkgdesc="IBM Plex Sans for Devanagari"
arch=('any')
url='https://github.com/IBM/plex'
license=('custom:OFL')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/%40ibm%2Fplex-sans-devanagari%40${pkgver}/ibm-plex-sans-devanagari.zip")
sha256sums=('effc4a35b2908c80806c97a4d5033e63f437611d17a3e09b237edd5c33d8ac94')

package() {
	cd ibm-plex-sans-devanagari/fonts/complete/ttf

    find -name "*.ttf" \
         -exec install -Dm644 {} -t "${pkgdir}/usr/share/fonts/TTF" \;

    install -Dm644 license.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
