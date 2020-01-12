# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=cawbird
pkgver=1.0.4
pkgrel=1
pkgdesc="Native Gtk+ Twitter Client"
arch=(i686 x86_64)
license=(GPL3)
url="https://ibboard.co.uk/cawbird/"
depends=(gtk3 sqlite3 gspell
         gst-plugins-good gst-plugins-bad gst-libav)
makedepends=(vala meson)
source=("$pkgname-$pkgver.tar.gz::https://github.com/IBBoard/cawbird/archive/v${pkgver}.tar.gz")
sha256sums=('f32f074dce371dbffcaa2913bcc72780c3a21819ef8d3479df732f68c05ef9e4')

build() {
  cd "$pkgname-$pkgver"
  meson _build --prefix=/usr
  ninja -C _build
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="${pkgdir}" ninja -C _build install
}
