# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=gtkcsslanguageserver
pkgver=0.1.0
pkgrel=1
pkgdesc='Language server for GTK CSS'
arch=(x86_64)
url='https://github.com/JCWasmx86/GTKCssLanguageServer'
license=(GPL-3.0-or-later)
depends=(
  glib2
  glibc
  gtk4
  json-glib
  jsonrpc-glib
)
makedepends=(
  git
  meson
  vala
)
source=(git+https://github.com/JCWasmx86/GTKCssLanguageServer.git)
b2sums=(SKIP)

build() {
  arch-meson GTKCssLanguageServer build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
