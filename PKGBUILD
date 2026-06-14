# Maintainer: James McMurray <jamesmcm03@gmail.com>

_pkgname="vopono-gui"
pkgname=vopono-gui-bin
pkgver=0.10.18
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
sha256sums=('1d3abd9b82e6f787878ab55a853b14ae55ecdeafb517c76ea1dff46700bb92dd'
            '53e20a4e1c3a3f1486cc05ae9cd19cbe1d9d3f92ed1e0445b4dfd45f7844d137')
sha256sums_x86_64=('eb96a1a9df90458d8b4d12c116f18a2b729f147d2e7697e26748331a67af398e')
provides=('vopono-gui')
conflicts=('vopono-gui')

package() {
  install -Dm755 ${_pkgname}-${pkgver} "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 vopono-gui.desktop "${pkgdir}/usr/share/applications/vopono-gui.desktop"
  install -Dm644 vopono-gui.png "${pkgdir}/usr/share/pixmaps/vopono-gui.png"
}
