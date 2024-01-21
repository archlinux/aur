# Maintainer: Marco Schröder <narco dot schroeder 96 at gmail dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=setzer
pkgver=65
pkgrel=1
pkgdesc='LaTeX editor written in Python with Gtk'
arch=('any')
url='https://github.com/cvfosammmm/setzer'
license=('GPL3')
depends=(
	'gspell'
	'gtk3'
	'gtksourceview5'
	'libhandy'
	'libportal'
	'poppler-glib'
	'python-cairo'
	'python-bibtexparser'
	'python-gobject'
	'python-numpy'
	'python-pdfminer'
	'python-pexpect'
	'python-pyxdg'
	'texlive-core'
	'texlive-xetex'
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
sha256sums=('68fda13b921afa7d4e45d97c36d6c1ffa7cf9f4c19717f3499341795e195d9a9')
