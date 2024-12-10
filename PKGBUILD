# Maintainer: Wind He <g311571057 at gmail dot com>
pkgname=ttf-ibm-plex-sans-sc
pkgver=1.1.0
pkgrel=1
pkgdesc="IBM Plex Sans for Simplified Chinese"
arch=('any')
url='https://github.com/IBM/plex'
license=('custom:OFL')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/@ibm/plex-sans-sc@${pkgver}/ibm-plex-sans-sc.zip")
provides=('ttf-font')
sha256sums=('0aabd737c8ef0206892b912c759101c10b86c6244be99f2e6b57c6905c716837')

package() {
    cd ibm-plex-sans-sc/fonts/complete/ttf/hinted
    find -name "*.ttf" -exec install -Dm644 {} -t "${pkgdir}/usr/share/fonts/TTF" \;

    install -Dm644 license.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
