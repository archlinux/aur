# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=gpu-screen-recorder-ui
pkgver=r124.99acbdb
pkgrel=1
pkgdesc='A fullscreen overlay UI for GPU Screen Recorder in the style of ShadowPlay'
arch=('x86_64')
url="https://git.dec05eba.com/gpu-screen-recorder-ui"
license=('GPL-3.0-only')
makedepends=('meson')
depends=(
    'gpu-screen-recorder'
    'gpu-screen-recorder-notification'
    'libglvnd'
    'libx11'
    'libxrandr'
    'libxrender'
    'libxfixes'
    'libxcomposite'
    'libevdev'
    'systemd-libs'
    'libinput'
    'libxkbcommon'
)
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/gpu-screen-recorder-ui.git.${pkgver}.tar.gz")
sha512sums=('cf0d320cd82080c9f12f67f29be73af76f4c8ee41f03915a6e7dce7d47f4e17bdb400f2364bf7731aaee176230add7026582ee1a65222a0877a6a4ef00a1201b')
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
