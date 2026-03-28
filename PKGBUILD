# Maintainer: Shira Nguyen <sn3446409@gmail.com>

_pkgname=xmodits-gui
pkgname=xmodits-gui-bin
_srcver="v0.12.3"
pkgver="${_srcver#v}"
pkgrel=1
pkgdesc="A tool to bulk extract samples from various tracker modules with ease."
arch=('x86_64')
url="https://github.com/B0ney/xmodits/"
license=('GPL-3.0-only')
depends=(
  hicolor-icon-theme
  glibc
  alsa-lib
  libgcc
)
options=(!strip)
provides=('xmodits' 'xmodits-gui')
conflicts=('xmodits-gui')
source=("${pkgname}-${pkgver}.tar.gz::${url}releases/download/${_srcver}/xmodits-gui-${_srcver}-linux-${CARCH}.tar.gz"
        xmodits-gui.png
        xmodits-gui.desktop)
sha256sums=('cb6cf750eae791d5a0c8dc2a38f68202fc5b2848c0bcf1a04cae92db4f5aa3f3'
            '5be1308fdac60700c8a0690464dab8bdcc03778899e19bde378b53637eca38f0'
            '871d475cd0336c73aac32131ac2e752539c1573c2d565d987df7fd228782c0b6')

package() {
    install -Dm755 "${srcdir}/xmodits-gui" "${pkgdir}/usr/bin/xmodits-gui"
    install -Dm644 "${srcdir}/xmodits-gui.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/xmodits-gui.png"
    install -Dm644 "${srcdir}/xmodits-gui.desktop" "${pkgdir}/usr/share/applications/xmodits-gui.desktop"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}




