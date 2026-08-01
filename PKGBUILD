# Maintainer: Upslaught <upslaught at tuta dot io>

pkgname=ttf-ibm-plex-math
pkgver=1.1.0
pkgrel=1
pkgdesc="IBM Plex Math"
arch=('any')
url='https://github.com/IBM/plex'
license=('custom:OFL')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/%40ibm%2Fplex-math%40${pkgver}/ibm-plex-math.zip")
sha256sums=('d85ed404394ced3a79a519af24611acdee9cc0483363c07cd5ac0656c06db42a')

package() {
	cd ibm-plex-math/fonts/complete/ttf

    find -name "*.ttf" \
         -exec install -Dm644 {} -t "${pkgdir}/usr/share/fonts/TTF" \;

    install -Dm644 license.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
