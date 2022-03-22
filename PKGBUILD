# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=gpu-screen-recorder-gtk-git
pkgver=r25.6162b5a
pkgrel=1
pkgdesc='Gtk frontend to gpu-screen-recorder, a shadowplay-like screen recorder for Linux. The fastest screen recorder for Linux.'
arch=('x86_64')
url="https://git.dec05eba.com/gpu-screen-recorder-gtk"
license=('GPL3')
depends=('gtk3' 'libx11' 'libxrandr' 'libpulse' 'gpu-screen-recorder' 'ffmpeg')
provides=('gpu-screen-recorder-gtk')
conflicts=('gpu-screen-recorder-gtk')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/gpu-screen-recorder-gtk.git.r25.6162b5a.tar.gz")
sha512sums=('235ad81230829b00c5a2f2533214ac29b46b42c32054a814bc78999f2053ba74a744a6c764ad7535f54e9c4d2aef73c60c7ba63dfa60bf59ba40a6dc2b05be45')

build() {
  cd "$srcdir"
  ./build.sh
}

package() {
  cd "$srcdir"
  install -Dm755 "gpu-screen-recorder-gtk" "$pkgdir/usr/bin/gpu-screen-recorder-gtk"
  install -Dm644 "gpu-screen-recorder-gtk.desktop" "$pkgdir/usr/share/applications/gpu-screen-recorder-gtk.desktop"
}
