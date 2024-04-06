# Maintainer: Johann Woelper <woelper@gmail.com>
pkgname=oculante-bin
pkgver=0.8.18
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
            '1d082e4a977a8a61a1a06f1a854d436617b5977f802bb88b9b7ffc3e5c9d7ef2'
            '8159398fbaa909f51cfb02684740917583ea5a88b8c743c28cdd70178161780f')
sha256sums_aarch64=('87b59dc1998394d07cbd8c6962bfc132ae725330d3161495b08441283665f4f6')
sha256sums_armv7h=('81fc79c7f0634b07676637ad35d190497ec94aa42856360b80360ea5854790bf')
sha256sums_x86_64=('8a36cb4b2328a534e01abff5ff7ac794385556b76182d163313df67b0db2f5f5')
package() {
    install -Dm755 "${srcdir}/target/release/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}