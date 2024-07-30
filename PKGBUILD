# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Fernando Fernández <fernando at softwareperonista dot com dot ar>
# Contributor: Balló György
# Contributor: Artem Vorotnikov <artem at vorotnikov dot me>
pkgname=gxml
pkgver=0.20.4
pkgrel=1
pkgdesc="GObject-based XML parser and writer library"
arch=('x86_64')
url="https://gitlab.gnome.org/GNOME/gxml"
license=('LGPL-2.1-or-later')
depends=('glib2' 'libgee' 'libxml2')
makedepends=('gobject-introspection' 'meson' 'vala')
source=("https://gitlab.gnome.org/GNOME/gxml/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('237f5d3984b6aa7378bfa030b7dadfad43041720f097bb5b4104e84829d741a5')

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
