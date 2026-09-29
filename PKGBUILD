# Maintainer: Carlos Suárez <bitseater@gmail.com>
pkgname=meteo-gtk4
pkgver=1.0.0
pkgrel=1
pkgdesc="Forecast application using OpenWeatherMap API built with Vala and Gtk"
arch=('x86_64')
url="https://gitlab.com/bitseater/meteo"
license=('GPL-3.0-or-later')
depends=(
  'dconf'
  'glib2'
  'glibc'
  'gtk4'
  'hicolor-icon-theme'
  'json-glib'
  'libadwaita'
  'libgee'
  'libsoup3'
  'webkitgtk-6.0'
)
makedepends=(
  'gettext'
  'meson'
  'ninja'
  'vala'
)
source=("$url/-/archive/$pkgver/meteo-$pkgver.tar.gz")
sha256sums=('8fa8424bd2027f49d055732ac186757c17cb7444d6ebc80b0a6a5f7e076a85ad')

build() {
  arch-meson "meteo-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  ln -s com.gitlab.bitseater.meteo "$pkgdir/usr/bin/meteo"
}
