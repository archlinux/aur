# Maintainer: Mort Yao <soi@mort.ninja>

pkgname=mlkit
pkgver=4.7.9
pkgrel=1
pkgdesc='Standard ML Compiler and Toolkit'
url='http://www.elsman.com/mlkit/'
license=('GPL2')
arch=('x86_64')
depends=('gmp')
makedepends=('mlton>=20170725')
source=("https://github.com/melsman/mlkit/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('f60bc85dd23d4771c69a66b7e68956a5')

build() {
  cd "$pkgname-$pkgver"
  ./autobuild
  ./configure --sysconfdir=/etc --prefix=/usr
  make mlkit
  make mlkit_libs
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
