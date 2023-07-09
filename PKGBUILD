# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=tilemaker
pkgver=2.4.0
pkgrel=2
pkgdesc="Convert OpenStreetMap .pbf files into vector tiles without the stack"
arch=('i686' 'x86_64')
url="https://github.com/systemed/tilemaker"
license=('custom')
install=$pkgname.install
depends=('boost-libs' 'lua>=5.1' 'protobuf' 'sqlite' 'shapelib' 'rapidjson')
makedepends=('boost')
source=("$pkgname-$pkgver.tar.gz::https://github.com/systemed/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('3dbcee04db82d9e16779a39f2ee5bcbcd78c39eb3d5873590ca98158c252d85beb2651680ccc59c7367cf24b11f11e967d7f52702752804fce8dde8eaeaa6f4e')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 0755 tilemaker $pkgdir/usr/bin/tilemaker
  install -Dm 0644 LICENCE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
