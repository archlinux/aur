# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=hydrapaper
pkgver=3.1.0
pkgrel=1
pkgdesc="A Gtk utility to set different backgrounds for each monitor on GNOME"
arch=('any')
url="https://hydrapaper.gabmus.org"
license=('GPL3')
depends=('gtk4' 'libadwaita' 'python-dbus' 'python-gobject' 'python-pillow' )
makedepends=('gobject-introspection' 'meson' 'pandoc')
checkdepends=('appstream')
source=("https://gitlab.gnome.org/GabMus/HydraPaper/-/archive/$pkgver/HydraPaper-$pkgver.tar.gz")
sha256sums=('fc69f1fa934743f1ee1f823248d9bfaaa2ced4af65176f9852bc5278bcb5a469')

build() {
  arch-meson HydraPaper-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
