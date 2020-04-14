# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=cawbird
pkgver=1.0.5
pkgrel=1
pkgdesc="Native Gtk+ Twitter Client"
arch=(i686 x86_64)
license=(GPL3)
url="https://ibboard.co.uk/cawbird/"
depends=(gtk3 sqlite3 gspell
         gst-plugins-good gst-plugins-bad gst-libav gst-plugin-gtk)
makedepends=(vala meson)
source=("$pkgname-$pkgver.tar.gz::https://github.com/IBBoard/cawbird/archive/v${pkgver}.tar.gz")
sha256sums=('bdbb9baa4e2555e20bc46dc37c9627842fe1b53bd0d70520f9ab5636024204dc')

build() {
  cd "$pkgname-$pkgver"
  meson _build --prefix=/usr
  ninja -C _build
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="${pkgdir}" ninja -C _build install
}
