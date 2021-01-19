# Maintainer: Mufeed Ali <lastweakness@tuta.io>

pkgname=komikku
_author=valos
_gitname=Komikku
pkgver=0.25.0
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
  python-dateparser
  python-gobject
  python-keyring
  python-lxml
  python-magic
  python-pillow
  python-pure-protobuf
  python-unidecode
)
makedepends=(
  gobject-introspection
  meson
)
source=("https://gitlab.com/$_author/$_gitname/-/archive/v$pkgver/$_gitname-v$pkgver.tar.gz")
sha256sums=('0b69b62b153ed4a94ec7fcd2ff997515ff39c02d7238950a4b81c614f981ea18')

prepare() {
  cd $_gitname-v$pkgver
  cd ..
}

build() {
  arch-meson $_gitname-v$pkgver build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}
