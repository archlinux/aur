# Maintainer: Mufeed Ali <fushinari@protonmail.com>

pkgname=komikku
_author=valos
_gitname=Komikku
pkgver=0.29.1
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
sha256sums=('a811d31dde0e6bd7d3cfb8167edd2fbc9d3237ca69d1e9e21345c52706b9620a')

build() {
  arch-meson $_gitname-v$pkgver build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}
