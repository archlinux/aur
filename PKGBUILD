# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ucm-desktop-bin
_pkgname='UCM Desktop'
pkgver=1.2.2
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
#source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/unisonweb/ucm-desktop/v${pkgver}/LICENSE")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1.arm64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1.x86_64.rpm")
sha256sums_aarch64=('8d9971d8a67b2afa0cdcbd9d228938d13d61a00340e88788149799b342df1aa4')
sha256sums_x86_64=('3b1561ff86ca2fd27358afb1498512f35366ffcc2b4d10cd4ae6bc6f74c236b8')
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
