# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-screenlocker
pkgver=0.4
pkgrel=1
pkgdesc="CutefishOS system screen locker"
arch=('x86_64')
url="https://github.com/cutefishos/screenlocker"
license=('GPL')
groups=('cutefish')
depends=('fishui' 'libcutefish')
makedepends=('extra-cmake-modules' 'qt5-tools')
source=("https://github.com/cutefishos/screenlocker/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('a1504a073f7d6e1e279710a2639d74765663b224f8e76f2c8e2f3e0137695bcd25b29d07c8d890932047d982c7157529afe31adad654b6149406587069eec5b8')

build() {
  cd screenlocker-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd screenlocker-$pkgver
  make DESTDIR="$pkgdir" install
}
