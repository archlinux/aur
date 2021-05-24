# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=setzer
pkgver=0.4.1
pkgrel=1
pkgdesc='LaTeX editor written in Python with Gtk'
arch=('any')
url='https://www.cvfosammmm.org/setzer/'
license=('GPL3')
depends=('gspell' 'gtk3' 'gtksourceview4' 'poppler-glib' 'python-cairo' 'python-gobject'
         'python-pdfminer' 'python-pyxdg' 'texlive-core' 'webkit2gtk' 'xdg-utils')
makedepends=('appstream' 'meson')
source=("https://github.com/cvfosammmm/Setzer/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('a76182c16a8dc699d6e36f0b330fa498a6b718fe44e0a0959db6ff05362c628f')

build() {
  arch-meson Setzer-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

