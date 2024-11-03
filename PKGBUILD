# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name=Patchance
pkgname="${_name,,}"
pkgver=1.1.0
pkgrel=3
pkgdesc='A modern graphical patchbay for JACK'
arch=(any)
url='https://github.com/Houston4444/Patchance'
license=(GPL-2.0-only)
depends=(hicolor-icon-theme python-pyqt5)
makedepends=(qt5-tools)
groups=(pro-audio)
source=("https://github.com/Houston4444/Patchance/releases/download/v$pkgver/$_name-$pkgver-source.tar.gz")
sha256sums=('c259042a43c7d82ff2ed34227085727166ed2d4757da12027145a2ee714de75c')


build() {
  cd $_name-$pkgver
  make
}

package() {
  cd $_name-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
