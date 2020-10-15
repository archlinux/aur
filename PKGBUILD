# Maintainer: Mufeed Ali <lastweakness@tuta.io>

pkgname=dialect
_author=gi-lom
_gitname=dialect
pkgver=1.0.0
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
)
makedepends=(
  gobject-introspection
  meson
)
source=("$_gitname-$pkgver.tar.gz::https://github.com/$_author/$_gitname/archive/$pkgver.tar.gz")
sha256sums=('6dc6599905d2a376d99a8cff3ef64c93b1b7b99d84f7850dfe56313ebc5883e6')

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
