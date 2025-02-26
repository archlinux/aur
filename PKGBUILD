# Maintainer: 'Radiolin' <anton.osi2011@gmail.com>
# Co-maintainer: Nebulosa <nebulosa2007 at yandex dot ru>

pkgname=cassette
pkgver=0.2.1
pkgrel=1
pkgdesc="GTK4/Adwaita application that allows you to use Yandex Music service on Linux operating systems"
arch=(aarch64 x86_64)
url="https://gitlab.gnome.org/Rirusha/${pkgname^}"
license=(GPL-3.0-or-later)
depends=(
  cairo
  dconf
  gdk-pixbuf2
  glibc
  glib2
  gst-plugins-good
  gstreamer
  gtk4
  json-glib
  hicolor-icon-theme
  libadwaita
  libsoup3
  libgee
  libxml2
  sqlite
  webkitgtk-6.0
  xdg-desktop-portal-impl
)
makedepends=(
  blueprint-compiler
  meson
  vala
)
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/${pkgname^}-v$pkgver.tar.gz")
sha512sums=('e637341d30a67534855b547ad4aba6c5360e6ac2df0818bfd279e8e6264c82b293cc49ea3eec7068239eb901f4884da15304fb270abc9eae4279eff869fb5f9b')
b2sums=('eaf6de50e350030c57cdba5d80429e48e264d08d2f6fe3d89f0cb02dc3043d29c577b14e7046824aedc38483021d3955e51a00ded4b2dcdf8e8c291e2c490785')

build() {
  arch-meson ${pkgname^}-v$pkgver build
  meson configure  build --no-pager
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
