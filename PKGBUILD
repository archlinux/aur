# Maintainer: Sebastien MacDougall-Landry

pkgname=libscry
pkgver=0.3.1
pkgrel=1
pkgdesc='A Magic: The Gathering library'
url='https://github.com/EmperorPenguin18/libscry/'
source=("$pkgname-$pkgver.tar.gz::https://github.com/EmperorPenguin18/libscry/archive/refs/tags/$pkgver.tar.gz")
arch=('x86_64')
license=('GPL3')
depends=('curl' 'sqlite' 'rapidjson')
sha256sums=('6991bd1ef3bc492e152be2b623c7a5510e43cd3ffe9c5c75f8c6a7147c350381')

build () {
  cd "$srcdir/$pkgname-$pkgver"
  g++ -O3 -std=c++20 -pthread -fPIC -shared src/*.cc -o libscry.so
}

package () {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 libscry.so -t "$pkgdir/usr/lib"
  install -Dm644 src/*.h -t "$pkgdir/usr/include/scry"
}
