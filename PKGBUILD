# Maintainer: Mufeed Ali <lastweakness@tuta.io>

pkgname=dialect
_author=gi-lom
_gitname=dialect
pkgver=1.2.0
pkgrel=2
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
  python-langdetect
)
makedepends=(
  gobject-introspection
  meson
)
source=("$_gitname-v$pkgver.tar.gz::https://github.com/$_author/$_gitname/archive/$pkgver.tar.gz")
sha256sums=('aec9e987d2e3f807602ffe96363314701efa572f6ece68de34a8590eacd9ed25')

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
