# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
pkgname=shuffledns-bin
pkgver=1.2.1
pkgrel=1
pkgdesc='MassDNS wrapper to resolve and enumerate valid subdomains'
arch=(
    'aarch64'
    'i686'
    'x86_64'
)
url="https://projectdiscovery.io/"
_ghurl='https://github.com/projectdiscovery/shuffledns'
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=()
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm64.zip")
source_i686=("${pkgname%-bin}-${pkgver}-i686.zip::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_386.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.zip")
sha256sums_aarch64=('8932012a72d2e7476d62b1219130828947391235ad8ddeba855127901abde9bc')
sha256sums_i686=('3bd204ad1903ced0ed8a3350fe2c4bde3d8b2000fd27fc1ed42e0cd5cd16986e')
sha256sums_x86_64=('8b155baa4482ba0df07cfe40f726ac1393f85777416b420bc83fea3a845a6e63')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
