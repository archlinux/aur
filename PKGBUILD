# Maintainer: James McMurray <jamesmcm03@gmail.com>

_pkgname="vopono-gui"
pkgname=vopono-gui-bin
pkgver=1.0.1
pkgrel=1
pkgdesc='Graphical frontend for vopono'
arch=('x86_64')
url='https://github.com/jamesmcm/vopono'
license=('GPL3')
depends=('vopono' 'gtk3' 'libayatana-appindicator' 'systemd-libs' 'xdotool')
source=("vopono-gui.desktop::${url}/raw/${pkgver}/vopono-gui/vopono-gui.desktop"
        "vopono-gui.png::${url}/raw/${pkgver}/vopono-gui/logos/badge.png")
source_x86_64=("${_pkgname}-${pkgver}::${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_linux_x86-64_gcc")
noextract=("${_pkgname}-${pkgver}")
sha256sums=('6878a9d45888799cb242c4daea6999bb0bb6c1317748f4c284cad3d24121a1d9'
            '53e20a4e1c3a3f1486cc05ae9cd19cbe1d9d3f92ed1e0445b4dfd45f7844d137')
sha256sums_x86_64=('c0b6f6defd38f0fad2a175617897d1fe9e61aaf43b5d71a33a3b9341e4520ff8')
provides=('vopono-gui')
conflicts=('vopono-gui')

package() {
  install -Dm755 ${_pkgname}-${pkgver} "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 vopono-gui.desktop "${pkgdir}/usr/share/applications/vopono-gui.desktop"
  install -Dm644 vopono-gui.png "${pkgdir}/usr/share/pixmaps/vopono-gui.png"
}
