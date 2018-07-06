# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=tilemaker
pkgver=1.5.0
pkgrel=1
pkgdesc="Convert OpenStreetMap .pbf files into vector tiles without the stack"
arch=('i686' 'x86_64')
url="https://github.com/systemed/tilemaker"
license=('custom')
install=$pkgname.install
depends=('boost-libs' 'lua51' 'protobuf' 'sqlite' 'shapelib')
makedepends=('boost')
source=("$pkgname-$pkgver.tar.gz::https://github.com/systemed/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('c826f8a0c1f9963ce48995c6ff4696b033fd3b582187ffaae6e46b8bdd2c7d6a157aea6df1ded69a294cccb1df6fd84824a5a749cbb55757ff0d6fdb3270f315')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 0755 tilemaker $pkgdir/usr/bin/tilemaker
  install -Dm 0644 LICENCE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
