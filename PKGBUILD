# Maintainer: Peter Nokes <peter@peternokes.co.uk>

pkgname=komikku
_author=valos
_gitname=Komikku
pkgver=1.37.1
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
  python-cloudscraper
  python-dateparser
  python-emoji
  python-gobject
  python-keyring
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
sha256sums=('b4cc801cd152fcb1fc25cc16f6e45ffc62056fb3003e474ae38d90fdbfc39be9')

build() {
  arch-meson $pkgname build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}
