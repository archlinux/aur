# Maintainer: Martin Wagner <martin.wagner.dev@gmail.com>

pkgname=plattenalbum
pkgver=2.8.0
pkgrel=1
pkgdesc="Connect to your music"
arch=('any')
license=('GPL-3.0-or-later')
url="https://github.com/SoongNoonien/plattenalbum"
depends=('gtk4>=4.22.0' 'python-gobject' 'libadwaita>=1.8.0')
makedepends=('meson' 'gettext' 'glib2')
provides=('mpdevil')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/SoongNoonien/plattenalbum/archive/v${pkgver}.tar.gz")
sha256sums=('20551e456ef1cc92144c574a6ad467306326f25452c276b8b9b6361f859f4150')

build() {
  arch-meson "${pkgname}-${pkgver}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

