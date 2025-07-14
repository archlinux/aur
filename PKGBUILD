# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=projectforge-bin
_pkgname='Project Forge'
pkgver=1.7.17
pkgrel=1
pkgdesc="Project Forge helps you build applications with Go.(Prebuilt version)"
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
depends=()
source=("LICENSE-${pkgver}.md::https://raw.githubusercontent.com/kyleu/projectforge/v${pkgver}/LICENSE.md")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm64.rpm")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_armv7.rpm")
source_i686=("${pkgname%-bin}-${pkgver}-i686.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_386.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.rpm")
sha256sums=('c13f88f8f26e1959cebd757842d7c7b067c7ec10a637fed994ccf7f6f6d6763e')
sha256sums_aarch64=('11ef4bc43a93e49a318f5b352843131ca07bfe5d32a42c2b56b2bdfda22c98cc')
sha256sums_armv7h=('8616c5b11219ef5dd037a5005935c887684982bc99890430081b752290d562b5')
sha256sums_i686=('bd454565efbee3ad87baec1fddae64eb7c9f9242f48c63657c6903a29fe5d313')
sha256sums_x86_64=('bd761476d55fde5d51bac6316d68a361746310e9aaf807b2b061b67904ef9d00')
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
