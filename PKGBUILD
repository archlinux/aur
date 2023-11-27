# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
pkgname=chaos-client-bin
pkgver=0.5.1
pkgrel=4
pkgdesc="Go client to communicate with Chaos DB API."
arch=(
    'aarch64'
    'armv7h'
    'i686'
    'x86_64'
)
url="https://chaos.projectdiscovery.io/"
_ghurl='https://github.com/projectdiscovery/chaos-client'
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm64.zip")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.zip::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_armv6.zip")
source_i686=("${pkgname%-bin}-${pkgver}-i686.zip::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_386.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.zip")
sha256sums_aarch64=('993297a08cf1fbf1850b2b9fe217a3bcd8188bae8ddf6534cde079e4a29216f0')
sha256sums_armv7h=('404fee57485f55fba4918638b1a30b5feaa0dd9e4ac4abb1ba1ee9aac8527c67')
sha256sums_i686=('ca213025272cf77b72198ddf2f135011cbfcb6e4b66c0ec4cb273b8494b6e980')
sha256sums_x86_64=('dc20ec21367051ca0608491703e564203ad2f59f85c4991370c1df70bd3ecc4a')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin" 
    install -Dm644 "${srcdir}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}