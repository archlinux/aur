# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=heimer-bin
pkgver=4.5.0
pkgrel=2
pkgdesc="A simple cross-platform mind map, diagram, and note-taking tool written in Qt.(Prebuilt version)"
arch=("x86_64")
url="https://github.com/juzzlin/Heimer"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'qt6-base'
    'qt6-svg'
)
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-ubuntu-24.04_amd64.deb")
sha256sums=('549b6a9bb3bd3a61ed5ff50c39b33e273611b8b88e8e776ff1fcda098754ede5')
prepare() {
    bsdtar -xf "${srcdir}/data."*
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/metainfo/${pkgname%-bin}.appdata.xml" -t "${pkgdir}/usr/share/metainfo"
}