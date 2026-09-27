# Maintainer: Carlos Suárez <bitseater@gmail.com>

pkgname=kmeteo
pkgver=0.1.1
pkgrel=1
pkgdesc="Forecast application using OpenWeatherMap API built with Python and Qt"
arch=('any')
url="https://gitlab.com/bitseater/kmeteo"
license=('GPL-3.0-or-later')
depends=(
  'hicolor-icon-theme'
  'python'
  'python-pyqt6'
  'python-pyqt6-webengine'
  'python-requests'
)
makedepends=(
  'gettext'
  'meson'
  'ninja'
)
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('550d06c2e24a8672e4a0c2e776a250e03c58cb0b45b94bd14c573758958d2c76')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  ln -s io.gitlab.bitseater.kmeteo "$pkgdir/usr/bin/$pkgname"
}
