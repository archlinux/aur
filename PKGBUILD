# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=gpu-screen-recorder-ui
pkgver=r84.ea0f9e5
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
sha512sums=('eda10923f67336120c43fdcfa8f89860af269a403e6c4f846858818261009e084e763290cd3a1f1acebcdab0cc8a2c16ebfbd40cf1a4f69bef21c9f26b360b08')
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
