# Maintainer: Mufeed Ali <lastweakness@tuta.io>

pkgname=komikku
_author=valos
_gitname=Komikku
pkgver=0.14.0
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
sha256sums=('5d12938f11fc4ccd588818ad175bb8c61ec2c7c2e9052e78035d2a8c33d5b473')

build() {
  arch-meson $_gitname-v$pkgver build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}
