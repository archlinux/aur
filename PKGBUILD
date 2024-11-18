# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=gpu-screen-recorder-ui
pkgver=r109.b06113d
pkgrel=1
pkgdesc='A fullscreen overlay UI for GPU Screen Recorder in the style of ShadowPlay. X11 only.'
arch=('x86_64')
url="https://git.dec05eba.com/gpu-screen-recorder-ui"
license=('GPL-3.0-only')
makedepends=('meson')
depends=('gpu-screen-recorder' 'gpu-screen-recorder-notification' 'libglvnd' 'libx11' 'libxrandr' 'libxrender' 'libxfixes' 'libxcomposite')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/gpu-screen-recorder-ui.git.${pkgver}.tar.gz")
sha512sums=('151b155271d2350f0a0d6c0d76701ebb619b9e30fe2b8235d1185709bf0bb94f4fb9c2560971f1ad60e162ffc2ff45d8008694e0ae6ea19df267a57c6c9fe217')
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
