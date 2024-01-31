# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
pkgname=shuffledns-bin
pkgver=1.0.9
pkgrel=3
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
sha256sums_aarch64=('92e656dad18013c3cdcef8e0be31eb584a87e42e991b2726dc8e2a5170875fe9')
sha256sums_i686=('39ac749e39c3b320e34a7d13d643bcc523ece5603f5e3f52d06f7c6bc359d5cf')
sha256sums_x86_64=('3a01beae518cc68889aa501b44ffc3af04522114d113eb5c59721beafbdc9bc8')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}