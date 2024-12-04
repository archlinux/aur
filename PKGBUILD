# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=gpu-screen-recorder-notification
pkgver=r39.31a9c2a
pkgrel=1
pkgdesc='Notification in the style of ShadowPlay'
arch=('x86_64')
url="https://git.dec05eba.com/gpu-screen-recorder-notification"
license=('GPL-3.0-only')
makedepends=('meson')
depends=('libglvnd' 'libx11' 'libxrandr' 'libxrender' 'libxext')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/gpu-screen-recorder-notification.git.${pkgver}.tar.gz")
sha512sums=('6e88205605c18e22da9ed58fbc5fed8e06f6aabe5483f79e7888e92ca998c80719db1dc6453881900c2db56db1c971f81454ae16795a9a16a982a3d13b6722d7')

build() {
  cd "$srcdir"
  arch-meson build
  meson compile -C build
}

package() {
  cd "$srcdir"
  meson install -C build --destdir "$pkgdir"
}
