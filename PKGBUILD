# Maintainer: Mufeed Ali <fushinari@protonmail.com>

pkgname=komikku
_author=valos
_gitname=Komikku
pkgver=0.29.0
pkgrel=1
pkgdesc='Online/offline Manga reader for GNOME, built for the Librem 5'
arch=(any)
url=https://gitlab.com/valos/Komikku
license=(GPL3)
depends=(
  gtk3
  libhandy
  python
  python-beautifulsoup4
  python-brotli
  python-cairo
  python-cffi
  python-dateparser
  python-gobject
  python-keyring
  python-lxml
  python-magic
  python-pillow
  python-pure-protobuf
  python-requests
  python-unidecode
  python-wheel
  webkit2gtk
)
makedepends=(
  gobject-introspection
  meson
)
optdepends=('org.freedesktop.secrets: store passwords safely')
source=("https://gitlab.com/$_author/$_gitname/-/archive/v$pkgver/$_gitname-v$pkgver.tar.gz")
sha256sums=('3fc60bd2568f4db36252457be9b4c2f2cd05a4652542418bd268b9e7159315dd')

build() {
  arch-meson $_gitname-v$pkgver build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}
