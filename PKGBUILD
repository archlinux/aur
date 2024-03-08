# Maintainer: Martin Wagner <martin.wagner.dev@gmail.com>

pkgname=plattenalbum
pkgver=2.0.1
pkgrel=1
pkgdesc="Browse music with MPD"
arch=('any')
license=('GPL3')
url="https://github.com/SoongNoonien/plattenalbum"
depends=('python-mpd2>=3.1' 'gtk4' 'python-gobject' 'libadwaita')
makedepends=('meson' 'gettext' 'glib2')
provides=('mpdevil')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/SoongNoonien/plattenalbum/archive/v${pkgver}.tar.gz")
sha256sums=('cee314bc90b78492f64661860e58db16ec47754f038c80b40a312dbafd186826')

build() {
  arch-meson "${pkgname}-${pkgver}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

