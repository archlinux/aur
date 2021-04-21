# Maintainer: renyuneyun (Rui ZHAO) <renyuneyun@gmail.com>

pkgname=feedreader-decsync-git
pkgver=2.11.0.20200923.6b91326
pkgrel=1
pkgdesc="This is a fork of the archived jangernert/FeedReader, a modern desktop application designed to complement existing web-based RSS accounts, but with an updated DecSync plugin."
arch=('any')
url="https://github.com/39aldo39/FeedReader"
license=('MIT')
depends=('curl' 'org.freedesktop.secrets' 'gnome-online-accounts' 'gumbo-parser' 'libgee' 'libpeas' 'libdecsync')
makedepends=('gobject-introspection' 'meson' 'vala')
source=("git+https://github.com/39aldo39/FeedReader.git")
sha256sums=('SKIP')

build() {
  arch-meson FeedReader build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
