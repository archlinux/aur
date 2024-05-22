# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
pkgname=shuffledns-bin
pkgver=1.1.0
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
sha256sums_aarch64=('91d63e0ac6bea9db1efddbd32aa844be16264f167468a6580da2113aa2740778')
sha256sums_i686=('e39c5bc84afe3d38457b911442406eb6b715c0579f7943a370cd9cccd9ad7afd')
sha256sums_x86_64=('86cb65842bdbb30107fcb746b838b38bbeee39a06fe10a038727cca89fed83cf')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}