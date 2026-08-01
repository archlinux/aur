# Maintainer: Upslaught <upslaught at tuta dot io>

pkgname=ttf-ibm-plex-sans-thai
pkgver=1.1.0
pkgrel=1
pkgdesc="IBM Plex Sans for Thai"
arch=('any')
url='https://github.com/IBM/plex'
license=('custom:OFL')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/%40ibm%2Fplex-sans-thai%40${pkgver}/ibm-plex-sans-thai.zip")
sha256sums=('d7203f43c20f9abd40487f845c48db4077d2056ea18632c8959591c6815d7fb9')

package() {
    cd ibm-plex-sans-thai/fonts/complete/ttf
    find -name "*.ttf" \
         -exec install -Dm644 {} -t "${pkgdir}/usr/share/fonts/TTF" \;

    install -Dm644 license.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
