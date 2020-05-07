# Maintainer: Mufeed Ali <lastweakness@tuta.io>

pkgname=komikku
_author=valos
_gitname=Komikku
pkgver=0.15.1
pkgrel=1
pkgdesc='Online/offline Manga reader for GNOME, built for the Librem 5'
arch=(any)
url=https://gitlab.com/valos/Komikku
license=(GPL3)
depends=(
  gtk3
  libhandy
  libsecret
  python
  python-beautifulsoup4
  python-cairo
  python-cloudscraper
  python-dateparser
  python-gobject
  python-lxml
  python-magic
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
sha256sums=('983641da25a6d3158e3fc248d450ec1219a22af014803e49a71a56736919feeb')

build() {
  arch-meson $_gitname-v$pkgver build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}
