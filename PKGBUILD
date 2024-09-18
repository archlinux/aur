# Maintainer: Martin Wagner <martin.wagner.dev@gmail.com>

pkgname=plattenalbum
pkgver=2.2.0
pkgrel=1
pkgdesc="Connect to your music"
arch=('any')
license=('GPL-3.0-or-later')
url="https://github.com/SoongNoonien/plattenalbum"
depends=('python-mpd2>=3.1' 'gtk4' 'python-gobject' 'libadwaita>=1.6.0')
makedepends=('meson' 'gettext' 'glib2')
provides=('mpdevil')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/SoongNoonien/plattenalbum/archive/v${pkgver}.tar.gz")
sha256sums=('95fddcc340bbc7e22f7a889e23d5b88752623a37eb0cb6be3673488282257cab')

build() {
  arch-meson "${pkgname}-${pkgver}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

