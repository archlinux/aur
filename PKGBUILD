# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=gpu-screen-recorder-gtk
pkgver=r409.49a8ee0
pkgrel=1
pkgdesc='Gtk frontend to gpu-screen-recorder, a shadowplay-like screen recorder for Linux. The fastest screen recorder for Linux'
arch=('x86_64')
url="https://git.dec05eba.com/gpu-screen-recorder-gtk"
license=('GPL-3.0-only')
makedepends=('meson' 'gtk-update-icon-cache' 'desktop-file-utils')
depends=('gtk3' 'libx11' 'libxrandr' 'libpulse' 'libayatana-appindicator' 'gpu-screen-recorder')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/gpu-screen-recorder-gtk.git.${pkgver}.tar.gz")
sha512sums=('30af1564360d1a23f83a56ffa6a9d84ee220c6383ba0424aa7e496c2f055ef8b1febc6cc2a941f7fa4f051a461d24217557c57aa3426f60cf8c8805b88402efe')

build() {
  cd "$srcdir"
  arch-meson build
  meson compile -C build
}

package() {
  cd "$srcdir"
  meson install -C build --destdir "$pkgdir"
}
