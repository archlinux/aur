# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name=Patchance
pkgname="${_name,,}"
pkgver=1.0.0
pkgrel=1
pkgdesc='A modern graphical patchbay for JACK'
arch=(any)
url='https://github.com/Houston4444/Patchance'
license=(GPL2)
depends=(hicolor-icon-theme python-pyqt5)
makedepends=(qt5-tools)
groups=(pro-audio)
source=("https://github.com/Houston4444/Patchance/releases/download/v$pkgver/$_name-$pkgver-source.tar.gz")
sha256sums=('f199fac5c0efe210455e76972bdc6c958101f2e1c47c83fed4d2af70f0321e3d')


build() {
  cd $_name-$pkgver
  make
}

package() {
  cd $_name-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
