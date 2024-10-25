# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=gpu-screen-recorder-notification
pkgver=r33.7139c92
pkgrel=1
pkgdesc='Notification in the style of ShadowPlay'
arch=('x86_64')
url="https://git.dec05eba.com/gpu-screen-recorder-notification"
license=('GPL-3.0-only')
makedepends=('meson')
depends=('libglvnd' 'libx11' 'libxrandr' 'libxrender')
provides=('gsr-notify')
conflicts=('gsr-notify')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/gpu-screen-recorder-notification.git.${pkgver}.tar.gz")
sha512sums=('5e1b10cc255bd5b15943706131d786d7f225c363c92cf0e4c4c2ac81a0ce4d6ebb40a831f737ff5f7e9385c3242d237fa2e7312a740e470d2619578d526cb890')

build() {
  cd "$srcdir"
  arch-meson build
  meson compile -C build
}

package() {
  cd "$srcdir"
  meson install -C build --destdir "$pkgdir"
}
