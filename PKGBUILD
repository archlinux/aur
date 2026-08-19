# Maintainer: vizh <alex@alexbangert.dev>

pkgname=simhammer-bin
pkgver=4.1.0
pkgrel=1
pkgdesc='Desktop client for SimHammer, a SimulationCraft interface'
arch=('x86_64')
url='https://simhammer.com'
license=('custom')
depends=('fuse2')
options=('!strip')
source=("${pkgname}-${pkgver}.AppImage::https://github.com/sortbek/simcraft/releases/download/v${pkgver}/SimHammer-${pkgver}.AppImage"
        "${pkgname}.desktop"
        'simhammer')
sha256sums=('7249045128e735a5d375d94bd31c26f4ec8800496407fd00c08ea5d0a807ffaf'
            'SKIP'
            'SKIP')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/simhammer/simhammer.AppImage"
  install -Dm755 "${srcdir}/simhammer" "${pkgdir}/usr/bin/simhammer"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
