# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=heimer-bin
pkgver=4.2.0
pkgrel=3
pkgdesc="A simple cross-platform mind map, diagram, and note-taking tool written in Qt."
arch=("x86_64")
url="https://github.com/juzzlin/Heimer"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'qt5-base'
    'qt5-svg'
)
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-ubuntu-22.04_amd64.deb")
sha256sums=('b2ff590499dd16c773312f53e956148621831199d294dee1173915ad621acb51')
build() {
    bsdtar -xf "${srcdir}/data.tar.gz"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/metainfo/${pkgname%-bin}.appdata.xml" -t "${pkgdir}/usr/share/metainfo"
}