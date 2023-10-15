# Maintainer: Martin Wagner <martin.wagner.dev@gmail.com>

pkgname=mpdevil
pkgver=1.10.3
pkgrel=1
pkgdesc="A simple music browser for MPD"
arch=('any')
license=('GPL3')
url="https://github.com/SoongNoonien/mpdevil"
depends=('python-mpd2>=3.1' 'gtk3' 'python-gobject' 'python-cairo')
makedepends=('meson')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/SoongNoonien/mpdevil/archive/v${pkgver}.tar.gz")
sha256sums=('090e50a21572b05933254721a6be8b32fd926e1aff12861bb7eb827bcfc2024a')

build() {
  arch-meson "${pkgname}-${pkgver}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

