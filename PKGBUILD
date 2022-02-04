# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-core
pkgver=0.7
pkgrel=1
pkgdesc="System components and backend of CutefishOS"
arch=('x86_64')
url="https://github.com/cutefishos/core"
license=('GPL')
groups=('cutefish')
depends=('fishui' 'kidletime' 'libcutefish' 'libpulse' 'libxcb' 'libxcursor' 'libxtst' 'polkit-qt5'
         'xf86-input-libinput' 'xf86-input-synaptics')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools' 'xorg-server-devel')
source=("https://github.com/cutefishos/core/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('e7ba4e2fae556d99fce392f8e0147e31cf79a7731b51552019daeb2895c3e3cd7699126981bb0fe3f2c663b4875ffb8c50ecd7d4ea81edd35e6dcec6f208926f')

build() {
  cd core-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd core-$pkgver
  make DESTDIR="$pkgdir" install
}
