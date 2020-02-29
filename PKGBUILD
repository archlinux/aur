# Maintainer: Mufeed Ali <lastweakness@tuta.io>

pkgname=komikku
_author=valos
_gitname=Komikku
pkgver=0.12.1
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
sha256sums=('b83d4b33b7c26778240b8ee5a67ecbdaeb8520d93ad5a799f083b1c751c85898')

build() {
  arch-meson $_gitname-v$pkgver build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
} 
