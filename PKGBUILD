# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=gpu-screen-recorder-notification
pkgver=r78.1d19340
pkgrel=1
pkgdesc='Notification in the style of ShadowPlay'
arch=('x86_64')
url="https://git.dec05eba.com/gpu-screen-recorder-notification"
license=('GPL-3.0-only')
makedepends=('meson')
depends=('libglvnd' 'libx11' 'libxrandr' 'libxrender' 'libxext' 'wayland')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/gpu-screen-recorder-notification.git.${pkgver}.tar.gz")
sha512sums=('7c5ae05dd11c6e178c7586ada84e92fe70d923bfa077ac6a5d0d37f9231a477934368e3541f0d814f750cd6a187ecad4d896c66192e9477bfa5a9ca1b311ca2c')

build() {
  cd "$srcdir"
  arch-meson build --buildtype=release -Dstrip=true
  meson compile -C build
}

package() {
  cd "$srcdir"
  meson install -C build --destdir "$pkgdir"
}
