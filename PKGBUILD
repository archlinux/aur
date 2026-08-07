# Maintainer: Martin Wagner <martin.wagner.dev@gmail.com>

pkgname=plattenalbum
pkgver=2.6.0
pkgrel=1
pkgdesc="Connect to your music"
arch=('any')
license=('GPL-3.0-or-later')
url="https://github.com/SoongNoonien/plattenalbum"
depends=('gtk4>=4.20.0' 'python-gobject' 'libadwaita>=1.8.0')
makedepends=('meson' 'gettext' 'glib2')
provides=('mpdevil')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/SoongNoonien/plattenalbum/archive/v${pkgver}.tar.gz")
sha256sums=('4139e766ef0607595617aef0502892452ea49f5b5815c668a0fed4c3f9f71609')

build() {
  arch-meson "${pkgname}-${pkgver}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

