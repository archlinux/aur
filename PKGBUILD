# Maintainer: Martin Wagner <martin.wagner.dev@gmail.com>

pkgname=mpdevil
pkgver=1.8.0
pkgrel=1
pkgdesc="A simple music browser for MPD"
arch=('any')
license=('GPL3')
url="https://github.com/SoongNoonien/mpdevil"
depends=('python-mpd2' 'gtk3' 'python-gobject')
makedepends=('meson')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/SoongNoonien/mpdevil/archive/v${pkgver}.tar.gz")
sha256sums=('8e0d17114ad4bfe43ccc6c877df8ac9357e3e4d2dde69867a79855a919b60e36')

build() {
  arch-meson "${pkgname}-${pkgver}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

