# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=gpu-screen-recorder-gtk-git
pkgver=r43.8db335d
pkgrel=1
pkgdesc='Gtk frontend to gpu-screen-recorder, a shadowplay-like screen recorder for Linux. The fastest screen recorder for Linux.'
arch=('x86_64')
url="https://git.dec05eba.com/gpu-screen-recorder-gtk"
license=('GPL3')
depends=('gtk3' 'libx11' 'libxrandr' 'libpulse' 'gpu-screen-recorder')
provides=('gpu-screen-recorder-gtk')
conflicts=('gpu-screen-recorder-gtk')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/gpu-screen-recorder-gtk.git.r43.8db335d.tar.gz")
sha512sums=('84c84c574dec6b08224de00817ea40703127ffc4e6468221deb2e750aded9f059033f8c11c960bca22105e135f50b35df016a5ac64777c5b7f41928a75978609')

build() {
  cd "$srcdir"
  ./build.sh
}

package() {
  cd "$srcdir"
  install -Dm755 "gpu-screen-recorder-gtk" "$pkgdir/usr/bin/gpu-screen-recorder-gtk"
  install -Dm644 "gpu-screen-recorder-gtk.desktop" "$pkgdir/usr/share/applications/gpu-screen-recorder-gtk.desktop"
}
