# Maintainer: Mufeed Ali <lastweakness@tuta.io>

pkgname=dialect
_author=gi-lom
_gitname=dialect
pkgver=1.1.1
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
source=("$_gitname-v$pkgver.tar.gz::https://github.com/$_author/$_gitname/archive/$pkgver.tar.gz")
sha256sums=('2b6df837409236322fbf395fc87c06d3b739099f3eced46ecfa52a0b5cb92dea')

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
