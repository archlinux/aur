# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=gpu-screen-recorder-gtk-git
pkgver=r49.d27f234
pkgrel=1
pkgdesc='Gtk frontend to gpu-screen-recorder, a shadowplay-like screen recorder for Linux. The fastest screen recorder for Linux.'
arch=('x86_64')
url="https://git.dec05eba.com/gpu-screen-recorder-gtk"
license=('GPL3')
depends=('gtk3' 'libx11' 'libxrandr' 'libpulse' 'gpu-screen-recorder')
provides=('gpu-screen-recorder-gtk')
conflicts=('gpu-screen-recorder-gtk')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/gpu-screen-recorder-gtk.git.r49.d27f234.tar.gz")
sha512sums=('0cb16f6574768931a90c7744aa8053fd6573cb2955594be2ee404ff77514d9fea4a5734eaa3667c402c7afe56ceae6a32fdd277b31000134adcfcb6da383d934')

build() {
  cd "$srcdir"
  ./build.sh
}

package() {
  cd "$srcdir"
  install -Dm755 "gpu-screen-recorder-gtk" "$pkgdir/usr/bin/gpu-screen-recorder-gtk"
  install -Dm644 "gpu-screen-recorder-gtk.desktop" "$pkgdir/usr/share/applications/gpu-screen-recorder-gtk.desktop"
}
