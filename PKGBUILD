# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=projectforge-bin
_pkgname='Project Forge'
pkgver=1.7.9
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
sha256sums_aarch64=('a261917d60157f6b7b403f45e23f3e03f4353c097c09009d2daedc438ebae55e')
sha256sums_armv7h=('0dd2a4ba08c02bef0bb3159012611530a34e0d0b5eb39ecd735d21e158f38dc2')
sha256sums_i686=('4efda669acbef7341d4ce9429bef1f65c01a80ce297abd47f838ff370d0f9a15')
sha256sums_x86_64=('fd188ae494f0e507af9fdec7d653a5d433360b282871451de6c61a26f8173e60')
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
