# Maintainer: Martin Wagner <martin.wagner.dev@gmail.com>

pkgname=plattenalbum
pkgver=2.4.1
pkgrel=1
pkgdesc="Connect to your music"
arch=('any')
license=('GPL-3.0-or-later')
url="https://github.com/SoongNoonien/plattenalbum"
depends=('python-mpd2>=3.1.0' 'gtk4>=4.20.0' 'python-gobject' 'libadwaita>=1.8.0')
makedepends=('meson' 'gettext' 'glib2')
provides=('mpdevil')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/SoongNoonien/plattenalbum/archive/v${pkgver}.tar.gz")
sha256sums=('33568256c7458fef5df1fa6640539ed51654a7866b07f0fd4c0569e831052f48')

build() {
  arch-meson "${pkgname}-${pkgver}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

