# Maintainer: Peter Nokes <peter@peternokes.co.uk>

pkgname=komikku
_author=valos
_gitname=Komikku
pkgver=1.48.1
pkgrel=1
pkgdesc='Online/Offline Manga reader based on GNOME | PinePhone/Librem 5 Support'
arch=(any)
url=https://codeberg.org/valos/Komikku
license=(GPL3)
depends=(
  blueprint-compiler
  libadwaita
  python-beautifulsoup4
  python-brotli
  python-cairo
  python-cffi
  python-curl-cffi
  python-colorthief
  python-cloudscraper
  python-dateparser
  python-emoji
  python-gobject
  python-keyring
  python-pillow_heif
  python-lxml
  python-magic
  python-natsort
  python-pillow
  python-piexif
  python-pure-protobuf
  python-unidecode
  python-wheel
  python-rarfile
  webkit2gtk
  webkitgtk-6.0
  python-colorthief
)
makedepends=(
  gobject-introspection
  meson
)
optdepends=('org.freedesktop.secrets: store passwords safely')
source=("https://codeberg.org/$_author/$_gitname/archive/v$pkgver.tar.gz")
sha256sums=('26b1960ce51685bbedc2c085b0acd6249ead4b29e59ecd9a94cf2a1f1513cca2')

build() {
  arch-meson $pkgname build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}
