# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=gpu-screen-recorder-ui
pkgver=r111.520687c
pkgrel=1
pkgdesc='A fullscreen overlay UI for GPU Screen Recorder in the style of ShadowPlay. X11 only.'
arch=('x86_64')
url="https://git.dec05eba.com/gpu-screen-recorder-ui"
license=('GPL-3.0-only')
makedepends=('meson')
depends=('gpu-screen-recorder' 'gpu-screen-recorder-notification' 'libglvnd' 'libx11' 'libxrandr' 'libxrender' 'libxfixes' 'libxcomposite')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/gpu-screen-recorder-ui.git.${pkgver}.tar.gz")
sha512sums=('9e83a6630c03821e543b78b6e64f84cfbceb932e661fef567a8c4af5d4a6e8da326a490f66959e832e02d1e491b1bf9112b37f4149b6aaf97f556b165cfe0590')
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
