# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ucm-desktop-bin
_pkgname='UCM Desktop'
pkgver=1.3.0
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
sha256sums_aarch64=('263a40f6272c77b9fbb642b0c793c4ba3fca0568c3fdd43705047cc54eefcddb')
sha256sums_x86_64=('da20c44ce3814fc8a0fdee56a6603e17e2d2d4ffca871f40230b993d4a049777')
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
