# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=micropython
pkgver=1.4.4
pkgrel=1
pkgdesc="Python3 for microcontrollers, unix version."
arch=('i686' 'x86_64')
url="http://micropython.org/"
license=('MIT')
depends=('readline' 'libffi')
makedepends=('python')
source=(https://github.com/micropython/micropython/archive/v$pkgver.tar.gz)
md5sums=('77c76aa236f0720b70a0fe593f72172c')

build() {
  cd "$pkgname-$pkgver/unix"
  make
}

check() {
  cd "$pkgname-$pkgver/unix"
  #make test
}

package() {
  cd "$pkgname-$pkgver/unix"
  install -Dm755 micropython "$pkgdir/usr/bin/micropython"
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

