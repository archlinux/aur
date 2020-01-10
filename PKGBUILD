# Maintainer: Mufeed Ali <lastweakness@tuta.io>

pkgname=komikku
_author=valos
_gitname=Komikku
pkgver=0.8.1
pkgrel=2
pkgdesc='Online/offline Manga reader for GNOME, built for the Librem 5'
arch=(any)
url=https://gitlab.com/valos/Komikku
license=(GPL)
depends=(
  gtk3
  libhandy
  python
  python-beautifulsoup4
  python-cairo
  python-gobject
  python-beautifulsoup4
  python-cloudscraper
  python-dateparser
  python-lxml
  python-magic-ahupp
  python-pillow
  python-pure-protobuf
  python-unidecode
)
makedepends=(
  git
  gobject-introspection
  meson
)
source=("https://gitlab.com/$_author/$_gitname/-/archive/v$pkgver/$_gitname-v$pkgver.tar.gz")
sha256sums=('f66c4f89bccfb0da1e28b5cc6ed3de3b5aa59fc0de9f105681187f955915a7e5')

build() {
  arch-meson $_gitname-v$pkgver build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
} 
