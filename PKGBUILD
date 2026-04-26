# Maintainer: Gallifreyan <gallifreyan at protonmail dot ch>

pkgname=godsvg-bin
_pkgbase=godsvg
_pkgname=GodSVG

_pkgver=1.0-alpha15
pkgver=${_pkgver//-/_}
pkgrel=1

pkgdesc='An editor for Scalable Vector Graphics (SVG) files. Built with Godot'
arch=('x86_64')

url='https://godsvg.com'
_url='https://github.com/MewPurPur/GodSVG'

license=('MIT')

depends=(
    glibc
    libglvnd
)
provides=(
    godsvg
)
conflicts=(
    godsvg
    godsvg-git
)

source=(
    "GodSVG-${_pkgver}.zip::${_url}/releases/download/v${_pkgver}/GodSVG_v${_pkgver}.Linux.${arch}.zip"
    "LICENSE::${_url}/raw/main/LICENSE"
    "godsvg.png::${_url}/raw/main/assets/logos/icon.png"
    "godsvg.svg::${_url}/raw/main/assets/logos/icon.svg"
    "godsvg.desktop::${_url}/raw/main/no_export/distribution/com.godsvg.GodSVG.desktop"
)
sha256sums=('0ed11e5922c3febc2b5cd510a96ffbc45c3d547a3be81ee637bbae6dc1166eaa'
            'a2e1a9795671794be3a25bd921a16f0fa9819ede1ead54a13da6edb34bfc0ee1'
            '28d5f232e6195a48e0b2a7e6e9259ced57b3b2a3caf46756f36c3bb00f1cabfc'
            'aee94d8f24577c6aaaf18ce16d3bb3a2eac1e79935044d663bafde5f6fb6417e'
            'dd38a23e6fe497fec37747c3a9f837016cafe86447dd9d34090d41a487288f7b')

options=(
    !strip
    !debug
)

package() {
    install -Dm755 "GodSVG_v${_pkgver}.${arch}" "${pkgdir}/usr/bin/godsvg"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 "godsvg.desktop" -t "${pkgdir}/usr/share/applications/"
    install -Dm644 "godsvg.png" -t "${pkgdir}/usr/share/pixmaps/"
    install -Dm644 "godsvg.svg" -t "${pkgdir}/usr/share/pixmaps/"
}
