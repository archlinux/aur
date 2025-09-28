# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ucm-desktop-bin
_pkgname='UCM Desktop'
pkgver=1.4.0
pkgrel=1
pkgdesc="A desktop app companion to the UCM CLI.(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://unison-lang.org/"
_ghurl="https://github.com/unisonweb/ucm-desktop"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
    'ucm-bin'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1.arm64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1.x86_64.rpm")
sha256sums_aarch64=('8c0586ba613cf5e52afe717e7dc15ec0af8a67e742b6c9b61b4b1b422e1cf6ed')
sha256sums_x86_64=('1182886a97f2a94a50bae1be085b6e3c240a0de4188c3a5756f91019c44aeb28')
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
