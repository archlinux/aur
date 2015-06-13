# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=micropython
pkgver=1.4.2
pkgrel=1
pkgdesc="Python3 for microcontrollers, unix version."
arch=('i686' 'x86_64')
url="http://micropython.org/"
license=('MIT')
depends=('readline' 'libffi')
makedepends=('python')
source=(https://github.com/micropython/micropython/archive/v$pkgver.tar.gz)
md5sums=('bc84f9f2ae2ef782b490a6afc3a2a666')

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

