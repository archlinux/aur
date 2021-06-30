# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-dock
pkgver=0.3
pkgrel=1
pkgdesc="CutefishOS application dock"
arch=('x86_64')
url="https://github.com/cutefishos/dock"
license=('GPL')
groups=('cutefish')
depends=('fishui' 'libcutefish' 'qt5-svg')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools')
source=("https://github.com/cutefishos/dock/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('0041267d0a2faee004e8049d32d691f885681e85a0e5366fe6019cf2bcb4b4afe3482b2642825388d732a861eb61ad39c98d50a0648a5ea93d2e1e9e69645199')

build() {
  cd dock-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd dock-$pkgver
  make DESTDIR="$pkgdir" install
}
