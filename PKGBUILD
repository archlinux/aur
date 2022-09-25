# Maintainer: Martin Wagner <martin.wagner.dev@gmail.com>

pkgname=mpdevil
pkgver=1.8.1
pkgrel=1
pkgdesc="A simple music browser for MPD"
arch=('any')
license=('GPL3')
url="https://github.com/SoongNoonien/mpdevil"
depends=('python-mpd2' 'gtk3' 'python-gobject')
makedepends=('meson')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/SoongNoonien/mpdevil/archive/v${pkgver}.tar.gz")
sha256sums=('c44005f8ba993b6151c01a8aecfa04a197f7d4ed713ee689754d8a1798055410')

build() {
  arch-meson "${pkgname}-${pkgver}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

