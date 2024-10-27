# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=gpu-screen-recorder-ui
pkgver=r79.0c5335e
pkgrel=1
pkgdesc='A fullscreen overlay UI for GPU Screen Recorder in the style of ShadowPlay. X11 only.'
arch=('x86_64')
url="https://git.dec05eba.com/gpu-screen-recorder-ui"
license=('GPL-3.0-only')
makedepends=('meson')
depends=('gpu-screen-recorder-notification' 'libglvnd' 'libx11' 'libxrandr' 'libxrender' 'libxfixes' 'libxcomposite')
provides=('gsr-ui')
conflicts=('gsr-ui')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/gpu-screen-recorder-ui.git.${pkgver}.tar.gz")
sha512sums=('bfb6ec2c7b4712d6c1d262366489b54dfb1e0692299958fb51b35dcfcf206d3c3e3cdcb5d10a863a54355d5481041b889c846adc8a32f65f9273be9ddb18516d')
install="${pkgname}.install"

build() {
  cd "$srcdir"
  arch-meson build
  meson compile -C build
}

package() {
  cd "$srcdir"
  meson install -C build --destdir "$pkgdir"
}
