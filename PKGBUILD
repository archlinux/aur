# Maintainer: PanNNN <cool.panjianhao@gmail.com>
pkgname=frame0
pkgver=1.0.1
pkgrel=1
pkgdesc="A Balsamiq-alternative wireframming tool for modern apps"
arch=('x86_64')
url="https://frame0.app"
license=('custom')
depends=(
  "gtk3"
  "nss"
  "libnotify"
  "libxtst"
  "xdg-utils"
  "at-spi2-core"
  "libdrm"
  "mesa"
  "libxcb"
  "glib2"
)
optdepends=(
  'pulseaudio'
)
source=("https://files.frame0.app/releases/linux/x64/frame0_${pkgver}_amd64.deb")
sha256sums=('045910d3be7d5430f1f17dda2dedee1a04036c64e52a7209ae9cd6eef3ca33ad')

package() {
  cd "${srcdir}"
  # Extract the .deb file
  ar x frame0_${pkgver}_amd64.deb
  # Extract the data.tar.xz file
  bsdtar -xf data.tar.xz -C "${pkgdir}"
}
