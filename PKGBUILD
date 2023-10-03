# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=setzer
pkgver=60
pkgrel=2
pkgdesc='LaTeX editor written in Python with Gtk'
arch=('any')
url='https://github.com/cvfosammmm/setzer'
license=('GPL3')
depends=(
	'gspell'
	'gtk3'
	'gtksourceview4'
	'libhandy'
	'poppler-glib'
	'python-cairo'
	'python-bibtexparser'
	'python-gobject'
	'python-pdfminer'
	'python-pexpect'
	'python-pyxdg'
	'texlive-core'
	'webkit2gtk'
	'webkitgtk-6.0'
	'xdg-utils')
makedepends=('appstream' 'meson')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver/$pkgver.tar.gz")

build() {
  arch-meson "Setzer-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
sha256sums=('ddf00415b82a1c3237a8ea00673977437cc00d2c49a2295c33792871fc63bfc1')
