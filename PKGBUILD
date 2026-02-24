# Maintainer: Gallifreyan <gallifreyan at protonmail dot ch>

pkgname=godsvg-bin
_pkgbase=godsvg
_pkgname=GodSVG

_pkgver=1.0-alpha14
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
    "GodSVG-${_pkgver}.zip::${_url}/releases/download/v${_pkgver}/GodSVG.Linux.zip"
    "LICENSE::${_url}/raw/main/LICENSE"
    "godsvg.png::${_url}/raw/refs/heads/main/assets/logos/icon.png"
    "godsvg.svg::${_url}/raw/refs/heads/main/assets/logos/icon.svg"
    "godsvg.desktop::${_url}/raw/main/assets/GodSVG.desktop"
)
sha256sums=('1b79d8f2e7cb4d7c2a3c95ce09bd03ca93706478d0b75f1964d0ae08166113a0'
            'a2e1a9795671794be3a25bd921a16f0fa9819ede1ead54a13da6edb34bfc0ee1'
            'c809390a25c9a922a1f122d48492dac8ed32c288df827c5605e86358d84cd1c1'
            '856be8b9a058cb35e1a75d50408d21498b127d68d47836787336cad740593f18'
            '3fd0e8568d879ee234c0e1621e8529f2ddaae5f63ccc4559d5ed3e0f7086dae2')

options=(
    !strip
    !debug
)

package() {
    install -Dm755 "GodSVG.${CARCH}" "${pkgdir}/usr/bin/godsvg"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 "godsvg.desktop" -t "${pkgdir}/usr/share/applications/"
    install -Dm644 "godsvg.png" -t "${pkgdir}/usr/share/pixmaps/"
    install -Dm644 "godsvg.svg" -t "${pkgdir}/usr/share/pixmaps/"
}
