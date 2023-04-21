# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=setzer
pkgver=55
pkgrel=1
pkgdesc='LaTeX editor written in Python with Gtk'
arch=('any')
url='https://github.com/cvfosammmm/setzer'
license=('GPL3')
depends=(
	'gspell'
	'gtk3'
	'gtksourceview4'
	'poppler-glib'
	'python-cairo'
	'python-gobject'
	'python-pdfminer'
	'python-pexpect'
	'python-pyxdg'
	'texlive-core'
	'webkit2gtk'
	'xdg-utils')
makedepends=('appstream' 'meson')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver/$pkgver.tar.gz")
sha256sums=('e0096886627159e61925b1d623c7f419193c4577b1f32acd8f6ea94a89ed0513')

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
