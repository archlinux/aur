# Maintainer: Jitang Zheng <jitang.zheng@gmail.com>
pkgname=mstch
pkgver=1.0.2
pkgrel=1
pkgdesc="mstch is a complete implementation of {{mustache}} templates using modern C++"
arch=('x86_64' 'i686')
url="https://github.com/no1msd/mstch"
license=('MIT')
depends=("boost")
makedepends=('cmake')
source=("https://github.com/no1msd/$pkgname/archive/$pkgver.tar.gz")
md5sums=('306e7fead7480884f698ab47a6082e18')

prepare() {
  cd "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$pkgdir/usr .
  make
}

check() {
  cd "$pkgname-$pkgver"
}

package() {
  cd "$pkgname-$pkgver"
  make install
}
