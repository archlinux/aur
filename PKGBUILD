# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Fernando Fernández <fernando at softwareperonista dot com dot ar>
# Contributor: Balló György
# Contributor: Artem Vorotnikov <artem at vorotnikov dot me>
pkgname=gxml
pkgver=0.20.3
pkgrel=1
pkgdesc="GObject-based XML parser and writer library"
arch=('x86_64')
url="https://gitlab.gnome.org/GNOME/gxml"
license=('LGPL-2.1-or-later')
depends=('glib2' 'libgee' 'libxml2')
makedepends=('gobject-introspection' 'meson' 'vala')
source=("https://gitlab.gnome.org/GNOME/gxml/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('66d7c761ae2dad14960911708d042382436c6b10f0b68e77d7c536697f663f53')

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
