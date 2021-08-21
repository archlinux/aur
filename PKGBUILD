# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-core
pkgver=0.4
pkgrel=2
pkgdesc="System components and backend of CutefishOS"
arch=('x86_64')
url="https://github.com/cutefishos/core"
license=('GPL')
groups=('cutefish')
depends=('fishui' 'libcutefish' 'libpulse' 'libxcursor' 'libxtst' 'polkit-qt5' 'xf86-input-libinput')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools')
source=("https://github.com/cutefishos/core/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('60259469fb1c697ee46c17508ebc508dd40e24d4772a58c52e8cb9a2ccf6debed9dce13296ea3d6f51d612cfc980f46717424216db051d43611a148912bee709')

build() {
  cd core-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd core-$pkgver
  make DESTDIR="$pkgdir" install
}
