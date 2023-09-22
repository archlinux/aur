# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=frigoligo-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="An universal wallabag client made with Flutter. "
arch=('x86_64')
url="https://github.com/casimir/frigoligo"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('at-spi2-core' 'cairo' 'pango' 'gdk-pixbuf2' 'harfbuzz' 'glibc' 'gtk3' 'gcc-libs' 'glib2' 'libepoxy' 'fontconfig')
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}-linux-x64.tar.gz"
    "LICENSE::https://raw.githubusercontent.com/casimir/frigoligo/v${pkgver}/LICENSE"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/casimir/frigoligo/v${pkgver}/assets/logos/${pkgname%-bin}.png"
    "${pkgname%-bin}.desktop")
sha256sums=('adddea1a132b546029c94e9640cbd3c2d744a7a0fd37d0171b3a94e6ddddd84b'
            '3feb1ea09cc75f148e715820992fd28a3881572e3540b629059f22293b2e17db'
            '886063acc61302d4ee369f06b6062257883dd4e3f1d6ab199ca8e64db3091491'
            '1d809eb1c0cae5d38051e7660c2e74439f9b21b746857085d5bf24fe76d1ed7e')
package() {
    install -Dm755 -d "${pkgdir}/"{usr/bin,opt}
    cp -r "${srcdir}/${pkgname%-bin}" "${pkgdir}/opt"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}