# Maintainer: Raphaël Slagmolen <tutul at naheulcraft dot be>
pkgname=plymouth-theme-manjaro-charge
pkgver=1.0
pkgrel=1
pkgdesc="A Plymouth theme based on Fedora's Charge theme, but featuring the Manjaro logo and colours."
arch=('any')
url='https://gitlab.com/Tutul/plymouth-theme-manjaro-charge'
license=('GPL')
depends=('plymouth')
install="${pkgname}.install"
source=(
    "https://gitlab.com/api/v4/projects/41563279/packages/generic/manjaro-charge/${pkgver}/manjaro-charge.tar.gz"
    "https://gitlab.com/api/v4/projects/41563279/packages/generic/manjaro-charge/${pkgver}/manjaro-charge.tar.gz.sig"
)
sha256sums=(
    '9256bf041a9c4e141f85d81c0f8fe34e37436cd800939f6f346bd6762d7d8a8c'
    '6f56d8216a750728a5d68f718b06a5587273505408eef459b4f4c0d78953da65'
)
validpgpkeys=('298358B59409045C6951F61ADC773C5B6D417714')

# Let you customize with one of the graphical environment logo provided (like Gnome, Plasma or Xfce)
# Use the package source repository to see what is aivalable to you or read the README.md for more info
_selectedwatermark="default"

prepare() {
    tar -xf manjaro-charge.tar.gz
    cd "${srcdir}/manjaro-charge"
    ln -sf watermark-${_selectedwatermark}.png watermark.png
}

package() {
    cd "${srcdir}/manjaro-charge"
    mkdir -p "${pkgdir}/usr/share/plymouth/themes/manjaro-charge"
    install -Dvm644 * "${pkgdir}/usr/share/plymouth/themes/manjaro-charge"
}
