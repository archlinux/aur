# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=gpu-screen-recorder-gtk-git
pkgver=r47.30b1f0b
pkgrel=1
pkgdesc='Gtk frontend to gpu-screen-recorder, a shadowplay-like screen recorder for Linux. The fastest screen recorder for Linux.'
arch=('x86_64')
url="https://git.dec05eba.com/gpu-screen-recorder-gtk"
license=('GPL3')
depends=('gtk3' 'libx11' 'libxrandr' 'libpulse' 'gpu-screen-recorder')
provides=('gpu-screen-recorder-gtk')
conflicts=('gpu-screen-recorder-gtk')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/gpu-screen-recorder-gtk.git.r47.30b1f0b.tar.gz")
sha512sums=('68929d809a90c41cce28a82ae586cdfcd6d08f64c4b8d41ea352f4737d95e65d25c4f125502f6840ba3ef72264832c87041105d0a49d9268e6a88dacb24e6f44')

build() {
  cd "$srcdir"
  ./build.sh
}

package() {
  cd "$srcdir"
  install -Dm755 "gpu-screen-recorder-gtk" "$pkgdir/usr/bin/gpu-screen-recorder-gtk"
  install -Dm644 "gpu-screen-recorder-gtk.desktop" "$pkgdir/usr/share/applications/gpu-screen-recorder-gtk.desktop"
}
