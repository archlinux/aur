# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=captfencoder-bin
pkgver=3.1.2
pkgrel=2
pkgdesc="A rapid cross platform network security tool suite, providing network security related code conversion, classical cryptography, cryptography, asymmetric encryption, miscellaneous tools, and aggregating all kinds of online tools."
arch=(x86_64)
url="https://github.com/guyoung/CaptfEncoder"
license=('unknown')
depends=('glu' 'libxcb' 'libglvnd' 'gmp' 'openssl-1.1' 'glibc' 'libxcursor' 'libx11' 'gcc-libs' 'libxft' 'libxrender' 'libxfixes' 'libxinerama' 'pango')
makedepends=('gendesk')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.bin::${url}/releases/download/${pkgver}/CaptfEncoder-ubuntu-20-x64-${pkgver}.bin"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/guyoung/CaptfEncoder/master/images/captfencoder-log-1.png")
sha256sums=('dfed9cbb934bae883f5ae2e6b1d71908a6a8238d7bfdf7b243d9d2c272a30462'
            '3c0c7b76c0bd5964f77f48d9a44ccc00b59784c14fcd2ce511c6129e71c324a8')
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}.bin" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Development;Utility" --name "CaptfEncoder" --exec "/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}