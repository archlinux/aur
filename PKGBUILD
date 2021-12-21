# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-core
pkgver=0.5
pkgrel=1
pkgdesc="System components and backend of CutefishOS"
arch=('x86_64')
url="https://github.com/cutefishos/core"
license=('GPL')
groups=('cutefish')
depends=('fishui' 'libcutefish' 'libpulse' 'libxcb' 'libxcursor' 'libxtst' 'polkit-qt5'
          'xf86-input-libinput' 'xf86-input-synaptics')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools' 'xorg-server-devel')
source=("https://github.com/cutefishos/core/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('bed1187bc78ab6b60958712a2df404c166e853d5e21e2933eec401f9cfe405e142bbeb3480597fa2b90d2f8d5caee8d95e7fe7f17cf5eaac11dca65d44401923')

build() {
  cd core-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd core-$pkgver
  make DESTDIR="$pkgdir" install
}
