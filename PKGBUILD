# Maintainer: Gallifreyan <gallifreyan at protonmail dot ch>

pkgname=godsvg-bin
_pkgbase=godsvg
_pkgname=GodSVG

_pkgver=1.0-alpha14
pkgver=${_pkgver//-/_}
pkgrel=3

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
    "godsvg.png::${_url}/raw/main/assets/logos/icon.png"
    "godsvg.svg::${_url}/raw/main/assets/logos/icon.svg"
    "godsvg.desktop::${_url}/raw/main/no_export/distribution/com.godsvg.GodSVG.desktop"
)
sha256sums=('1b79d8f2e7cb4d7c2a3c95ce09bd03ca93706478d0b75f1964d0ae08166113a0'
            'a2e1a9795671794be3a25bd921a16f0fa9819ede1ead54a13da6edb34bfc0ee1'
            '8992d89b2b00accf132c6ebf8c12dbf345a7e4211d1078f19ac52bfa63fd9f03'
            'e32e7b7e6606235816b235ca100d78d7eead4ff1bcaa78d093daa76b05a6a1ef'
            '46d2f41c1d45ed6c825c41ed6255da8a279d8dcab0b3fbf80f09c5a2f2fe87f8')

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
