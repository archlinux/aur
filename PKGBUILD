# Maintainer: Mufeed Ali <lastweakness@tuta.io>

pkgname=dialect
_author=gi-lom
_gitname=dialect
pkgver=1.1.0
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
sha256sums=('4439d6a522ba3d578e338e335aa86d44ff71ff483b9faf86e2288b21d11da181')

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
