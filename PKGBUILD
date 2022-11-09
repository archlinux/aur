# Maintainer: Peter Nokes <peter@peternokes.co.uk>

pkgname=komikku
_author=valos
_gitname=Komikku
pkgver=1.4.0
pkgrel=1
pkgdesc='Online/Offline Manga reader based on GNOME | PinePhone/Librem 5 Support'
arch=(any)
url=https://gitlab.com/valos/Komikku
license=(GPL3)
depends=(
  gtk4
  libadwaita
  python
  python-beautifulsoup4
  python-brotli
  python-cairo
  python-cffi
  python-cloudscraper
  python-dateparser
  python-gobject
  python-keyring
  python-lxml
  python-magic
  python-natsort
  python-pillow
  python-pure-protobuf
  python-requests
  python-unidecode
  python-wheel
  python-pytz
  python-rarfile
  webkit2gtk
  webkit2gtk-5.0
)
makedepends=(
  gobject-introspection
  meson
)
optdepends=('org.freedesktop.secrets: store passwords safely')
source=("https://gitlab.com/$_author/$_gitname/-/archive/v$pkgver/$_gitname-v$pkgver.tar.gz")
sha256sums=('3fd30e878e960022c39ceeb9f9c8073a072af2fe39e6a54ad47b188ec414e736')

build() {
  arch-meson $_gitname-v$pkgver build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}
