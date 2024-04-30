# Maintainer: Johann Woelper <woelper@gmail.com>
pkgname=oculante-bin
pkgver=0.8.19
pkgrel=1
pkgdesc="A minimalistic image viewer with analysis and editing tools"
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://github.com/woelper/oculante"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
)
options=('!lto')
source=(
    "${pkgname%-bin}-${pkgver}.desktop::https://raw.githubusercontent.com/woelper/oculante/${pkgver}/res/oculante.desktop"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/woelper/oculante/${pkgver}/res/oculante.png"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/woelper/oculante/${pkgver}/LICENSE"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${url}/releases/download/${pkgver}/${pkgname%-bin}_linux_aarch64_minimal.zip")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.zip::${url}/releases/download/${pkgver}/${pkgname%-bin}_linux_armv7_minimal.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${url}/releases/download/${pkgver}/${pkgname%-bin}_linux_minimal.zip")
sha256sums=('686d39ed8b79ca532457b1e9d5d1d6d673204b0f603aaf624ec77983ea4e9e5c'
            '8f370ebbe04d449d24c03d25c4194fd86ebf7f84da180fa93139be17a9c3742a'
            '8159398fbaa909f51cfb02684740917583ea5a88b8c743c28cdd70178161780f')
sha256sums_aarch64=('26a84600e638cf6d118d8cfc298f5a70001119aacb5b41e4e75571a7fb0e7ecd')
sha256sums_armv7h=('2ee73633ececef111dfa5d249dc7b96c923e79c31cfcf057be08323d91d774af')
sha256sums_x86_64=('1113476202f0b8d34a8c9e76ba2e40755681f8e491e3cdc5a3eec9c37b9743cb')
package() {
    install -Dm755 "${srcdir}/target/release/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}