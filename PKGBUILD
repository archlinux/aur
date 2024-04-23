# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
pkgname=chaos-client-bin
pkgver=0.5.2
pkgrel=1
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
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.zip::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm.zip")
source_i686=("${pkgname%-bin}-${pkgver}-i686.zip::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_386.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.zip")
sha256sums_aarch64=('cb5abe1e6fd4d6aab3abb2a21aa0193726af1413dd7a0783838be0c3135775f2')
sha256sums_armv7h=('779615b4cd24f9f88b332ba0d6386f15370402dba61224fe191942dc19b2c59b')
sha256sums_i686=('2e37476a59554c4f98d851c2e584040bd2abd79eb1f65022849ee6e664fc12a0')
sha256sums_x86_64=('0688348871717fbd4f30f19c3a6d5c20b458a0bc8d57e47d231f6477f27505e2')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin" 
    install -Dm644 "${srcdir}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}