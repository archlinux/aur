# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Jesse Jaara <jesse.jaara@gmail.com>
# Contributor: Gionn <me[at]gionn[dot]net>

pkgname=upnp-router-control
pkgver=0.3.4
pkgrel=1
pkgdesc="A GTK application to access the parameters of the router exposed via UPnP-IGD."
url="https://gitlab.gnome.org/DnaX/upnp-router-control"
arch=('x86_64')
license=('GPL3')
depends=('gtk3' 'gupnp')
makedepends=('meson')
checkdepends=('appstream-glib')
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('e6b12a25bb736f0aceff0c8a5f2722184b36e3ae39159101da435d51972d2210')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# vim:set ts=2 sw=2 et:
