# Maintainer: Upslaught <upslaught at tuta dot io>

pkgname=ttf-ibm-plex-mono-only
pkgver=2.5.0
pkgrel=1
pkgdesc="IBM Plex Mono (no additional languages)"
arch=('any')
url='https://github.com/IBM/plex'
license=('custom:OFL')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/%40ibm%2Fplex-mono%40${pkgver}/ibm-plex-mono.zip")
sha256sums=('6d23f01257663d8cc49a0d64c22ced630b79e0e2a0ac08a0da86e9a38bbc481c')

package() {
	cd ibm-plex-mono/fonts/complete/ttf

    find -name "*.ttf" \
         -exec install -Dm644 {} -t "${pkgdir}/usr/share/fonts/TTF" \;

    install -Dm644 license.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
