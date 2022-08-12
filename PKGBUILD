# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=setzer
pkgver=0.4.8
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
sha256sums=('4e347f538a5bf9d0be73de3b91fa79d3601c94ba1faf74f191f1904ec67fa2cf')

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
