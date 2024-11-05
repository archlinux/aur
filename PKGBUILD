# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=projectforge-bin
_pkgname="Project Forge"
pkgver=1.5.25
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
sha256sums_aarch64=('a2fb7f4332e2ad7a6ba4ef9270b132b867acd1cd48a3562994401c44919c1a20')
sha256sums_armv7h=('30930fc14fec5e7e8ead8dc7a047639da9ab03b3d7dbecff79b196e3d60314e7')
sha256sums_i686=('9edc69bb529108b15aa5f580888a49cb4164d4eb93aaa987b0b105fe73b808d6')
sha256sums_x86_64=('eb481379f4f138cf2f3982f858833d24b583f8e4380d40fc00369ad5d7455c1c')
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}