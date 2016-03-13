# Maintainer: Mort Yao <soi@mort.ninja>

pkgname=mlkit
pkgver=4.3.9
pkgrel=1
pkgdesc='Standard ML Compiler and Toolkit'
url='http://www.elsman.com/mlkit/'
license=('GPL2')
arch=('i686' 'x86_64')
depends=('gmp')
makedepends=('mlton>=20051202')
source=("https://github.com/melsman/mlkit/archive/$pkgname-$pkgver.tar.gz")
md5sums=('8a6d2146c935914ec5ff494d75bab602')

build() {
  cd "$pkgname-$pkgname-$pkgver"
  ./autobuild
  ./configure --sysconfdir=/etc --prefix=/usr
  make mlkit
  make mlkit_libs
}

package() {
  cd "$pkgname-$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
