# Maintainer: Martin Wagner <martin.wagner.dev@gmail.com>

pkgname=mpdevil
pkgver=1.10.2
pkgrel=1
pkgdesc="A simple music browser for MPD"
arch=('any')
license=('GPL3')
url="https://github.com/SoongNoonien/mpdevil"
depends=('python-mpd2' 'gtk3' 'python-gobject' 'python-cairo')
makedepends=('meson')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/SoongNoonien/mpdevil/archive/v${pkgver}.tar.gz")
sha256sums=('20a87972b9a5bb38b2bca131be614dcb91374d8dcbc83c86630d2abbc6886a69')

build() {
  arch-meson "${pkgname}-${pkgver}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

