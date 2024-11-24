# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=gpu-screen-recorder-ui
pkgver=r116.3468554
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
sha512sums=('cc8e6e10d1d3ba88d0a20a4f6540333f803a9049d161e960b181bb668b01185131a57b1e076020b1bfd89ecf9a9690feec4d8f8ab0d1be7856a7bd4e8c777722')
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
