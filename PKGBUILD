# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=gpu-screen-recorder-notification
pkgver=r47.7b3d412
pkgrel=1
pkgdesc='Notification in the style of ShadowPlay'
arch=('x86_64')
url="https://git.dec05eba.com/gpu-screen-recorder-notification"
license=('GPL-3.0-only')
makedepends=('meson')
depends=('libglvnd' 'libx11' 'libxrandr' 'libxrender' 'libxext')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/gpu-screen-recorder-notification.git.${pkgver}.tar.gz")
sha512sums=('983da92fa3c61f9be7e287db5df66ae54ffa35dccb2b83be4294e5800999271d6717dc8a53e419237a0527fddb13fe8afab1b7dc7218ca1667e14e4bd1e13362')

build() {
  cd "$srcdir"
  arch-meson build
  meson compile -C build
}

package() {
  cd "$srcdir"
  meson install -C build --destdir "$pkgdir"
}
