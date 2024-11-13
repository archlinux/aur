# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=projectforge-bin
_pkgname="Project Forge"
pkgver=1.5.28
pkgrel=1
pkgdesc="Project Forge helps you build applications with Go(Prebuilt version)."
arch=(
    'aarch64'
    'armv7h'
    'i686'
    'x86_64'
)
url="https://projectforge.dev/"
_ghurl="https://github.com/kyleu/projectforge"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
)
source=("LICENSE-${pkgver}.md::https://raw.githubusercontent.com/kyleu/projectforge/v${pkgver}/LICENSE.md")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm64.rpm")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_armv7.rpm")
source_i686=("${pkgname%-bin}-${pkgver}-i686.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_386.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.rpm")
sha256sums=('c13f88f8f26e1959cebd757842d7c7b067c7ec10a637fed994ccf7f6f6d6763e')
sha256sums_aarch64=('255995a9486df575bc8a9fa82238c9ac8e962ea34e7e72e6d96b91e7b3d061fc')
sha256sums_armv7h=('8d5890402b452f0a4d72b25024cd68b13a02c28980df8bb39930b13d4ad90575')
sha256sums_i686=('a9f9acf07ba6d80d1866cef6faae6e387fa64bbf1273534d2ab6f317bf209d18')
sha256sums_x86_64=('f90f56fc128144b8cf1c8daa659c8e1e1a09dde517131f497bae3a080cdc1d91')
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
