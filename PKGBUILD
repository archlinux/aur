# Maintainer: Sebastien MacDougall-Landry

pkgname=libscry
pkgver=0.2
pkgrel=1
pkgdesc='A Magic: The Gathering library'
url='https://github.com/EmperorPenguin18/libscry/'
source=("$pkgname-$pkgver.tar.gz::https://github.com/EmperorPenguin18/libscry/archive/refs/tags/$pkgver.tar.gz")
arch=('x86_64')
license=('GPL3')
depends=('curl' 'sqlite' 'rapidjson')
sha256sums=('3c35bee0e7383f704f2ff59ae100a708c0c36772d0b1b375c481587a6cea3622')

build () {
  cd "$srcdir/$pkgname-$pkgver"
  g++ -std=c++20 -lcurl -lsqlite3 -fPIC -shared libscry.cc -o libscry.so
}

package () {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 libscry.so -t "$pkgdir/usr/lib"
  install -Dm644 libscry.h -t "$pkgdir/usr/include"
}
