# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=gpu-screen-recorder-ui
pkgver=r92.3d51801
pkgrel=1
pkgdesc='A fullscreen overlay UI for GPU Screen Recorder in the style of ShadowPlay. X11 only.'
arch=('x86_64')
url="https://git.dec05eba.com/gpu-screen-recorder-ui"
license=('GPL-3.0-only')
makedepends=('meson')
depends=('gpu-screen-recorder-git' 'gpu-screen-recorder-notification' 'libglvnd' 'libx11' 'libxrandr' 'libxrender' 'libxfixes' 'libxcomposite')
provides=('gsr-ui')
conflicts=('gsr-ui')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/gpu-screen-recorder-ui.git.${pkgver}.tar.gz")
sha512sums=('3dbfcf4085e3cd731ca56b24e05fd259f2f0dd92111f36beedc33d0d5998215629033269807d5d2a109d93c70ba13f50bd6b100edf39170e2c5ff0df4d92c1e4')
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
