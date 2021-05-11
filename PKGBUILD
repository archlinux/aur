# Maintainer: Mufeed Ali <lastweakness@tuta.io>

pkgname=dialect
_author=gi-lom
_gitname=dialect
pkgver=1.3.0
pkgrel=1
pkgdesc='A translation app for GNOME based on Google Translate'
arch=(any)
url=https://github.com/gi-lom/dialect
license=(GPL3)
depends=(
  gtk3
  gst-python
  libhandy
  python
  python-gobject
  python-googletrans
  python-gtts
  python-h2
  python-httpx
)
makedepends=(
  gobject-introspection
  meson
)
source=("$_gitname-v$pkgver.tar.gz::https://github.com/$_author/$_gitname/archive/$pkgver.tar.gz")
sha256sums=('c5f11de1c3067d05bd81a8964ec40a9c6334c6772069c61f999f719d5e36cbae')

prepare() {
  cd $_gitname-$pkgver
  cd ..
}

build() {
  arch-meson $_gitname-$pkgver build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}
