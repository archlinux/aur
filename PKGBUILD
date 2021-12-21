# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-dock
pkgver=0.5
pkgrel=1
pkgdesc="CutefishOS application dock"
arch=('x86_64')
url="https://github.com/cutefishos/dock"
license=('GPL')
groups=('cutefish')
depends=('fishui' 'qt5-svg')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools')
source=("https://github.com/cutefishos/dock/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('0cfa7afc6c58f09f7a684a376bdf52fab13f6c203c15556ea9ad6fc41d00aa1e6c06663dcf18b655bcee3143098f86ccdb7af4a30d67179bc58ac87ebfb33283')

build() {
  cd dock-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd dock-$pkgver
  make DESTDIR="$pkgdir" install
}
