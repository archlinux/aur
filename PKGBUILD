# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=projectforge-bin
_pkgname="Project Forge"
pkgver=1.6.2
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
sha256sums_aarch64=('cecbeaf9a6ba4854f1229dd551e028672e9ee2f097f110991f3ef66f738fa6bb')
sha256sums_armv7h=('cddbfedca696fea66d97c159347a5b61acfc69f43793fb3c382fa3bb643609f9')
sha256sums_i686=('5c6a6bec79f7c9215d3110d8baaf7cfda5509742a3ec54e541e2d0624f8cae85')
sha256sums_x86_64=('dfff03b7b9acabb4bce072082b41862314edb28341903e8e67f9b82f096dbc93')
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}