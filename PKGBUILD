# Maintainer: kamisaki
pkgname=citch
pkgver=1.0.0
pkgrel=1
pkgdesc="citch - fast system fetch written in C++"
arch=('x86_64')
url="https://github.com/xeyossr/citch"
license=('GPL3')
depends=('gcc' 'filesystem')
makedepends=('cmake' 'gcc' 'make')
source=("git+https://github.com/xeyossr/citch.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  mkdir -p build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "$srcdir/$pkgname/build"
  install -Dm755 citch "$pkgdir/usr/bin/citch"
}
