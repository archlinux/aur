# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=cawbird
pkgver=1.0.3.1
pkgrel=1
pkgdesc="Native Gtk+ Twitter Client"
arch=(i686 x86_64)
license=(GPL3)
url="https://ibboard.co.uk/cawbird/"
depends=(gtk3 sqlite3 gspell
         gst-plugins-good gst-plugins-bad gst-libav)
makedepends=(vala meson)
source=("$pkgname-$pkgver.tar.gz::https://github.com/IBBoard/cawbird/archive/v${pkgver}.tar.gz")
sha256sums=('674fc8550fb978ee5dcff250fa5e81d1017d20d0a7f9a39d557bff3a6aec9b0a')

build() {
  cd "$pkgname-$pkgver"
  meson _build --prefix=/usr
  ninja -C _build
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="${pkgdir}" ninja -C _build install
}
