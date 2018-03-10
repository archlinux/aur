# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=marker
pkgver=2018.03.09
pkgrel=1
pkgdesc='Markdown editor for linux made with Gtk+-3.0'
arch=('x86_64')
url='https://github.com/fabiocolacio/Marker'
license=('GPL3')
depends=('gtksourceview3' 'gtkspell3' 'webkit2gtk')
makedepends=('meson')
optdepends=('pandoc: export to HTML, PDF, RTF, OTF, DOCX, LaTeX')
source=("$pkgname-$pkgver.tar.xz::$url/releases/download/Marker.$pkgver.tar.xz")
sha256sums=('3ea9a962735ad7ad6ba6fbe3686a7aada9d1fbdb20ee90b1fca3623253cd3513')

build() {
  cd Marker
  meson --prefix=/usr build
  ninja -C build
}

package() {
  cd Marker
  DESTDIR="$pkgdir" ninja install -C build
}
