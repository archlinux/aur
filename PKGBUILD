# Maintainer: flan_suse <windows2linux_AT_zoho_DOT_com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=czkawka-cli-bin
pkgver=10.0.0
pkgrel=2
pkgdesc='Find and manage duplicate files, empty folders, similar images, and other "lint" (CLI)'
arch=('x86_64')
url='https://github.com/qarmin/czkawka'
license=('MIT')
provides=('czkawka-cli')
conflicts=('czkawka-cli')
depends=('gcc-libs' 'libheif')
source=("${pkgname}-${pkgver}::https://github.com/qarmin/czkawka/releases/download/${pkgver}/linux_${pkgname%-cli-bin}_cli_heif_raw_x86_64"
        "LICENSE_MIT-${pkgver}::https://github.com/qarmin/czkawka/raw/${pkgver}/${pkgname%-cli-bin}_cli/LICENSE_MIT")
sha256sums=('559dbaedfcbb1f229ac6a96c9e397421a01a53c29c613655b80ef1a565b450fd'
            '85325b49534d038568a13c5f5d66e77f391b6c4bd274eac4fad3e13a325cce3e')

package() {
  install -Dm755 ${pkgname}-${pkgver} "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 LICENSE_MIT-${pkgver} "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE_MIT"
}
