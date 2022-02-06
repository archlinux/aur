# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-launcher
pkgver=0.7
pkgrel=1
pkgdesc="CutefishOS's full-screen application launcher"
arch=('x86_64')
url="https://github.com/cutefishos/launcher"
license=('GPL')
groups=('cutefish')
depends=('fishui' 'kwindowsystem' 'libcutefish')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools')
source=("https://github.com/cutefishos/launcher/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('186c3686092318d12bff88ab432dd6a3b7e1e3824d0619a9ae24c1ac8698256b602156c38ea4853168672d60b53fb4b3cfb9d3533c09a68301d2b86cb44f9a15')

build() {
  cd launcher-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd launcher-$pkgver
  make DESTDIR="$pkgdir" install
}
