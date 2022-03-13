# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=tilemaker
pkgver=2.2.0
pkgrel=1
pkgdesc="Convert OpenStreetMap .pbf files into vector tiles without the stack"
arch=('i686' 'x86_64')
url="https://github.com/systemed/tilemaker"
license=('custom')
install=$pkgname.install
depends=('boost-libs' 'lua>=5.1' 'protobuf' 'sqlite' 'shapelib' 'rapidjson')
makedepends=('boost')
source=("$pkgname-$pkgver.tar.gz::https://github.com/systemed/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('e006e9de422c5e4224456d9b08408dce380d776ddf07e643e9e686a03cf97fa24bc42143f3f09dd0e5e9186716d4665af93345e315d941b52561b8671e6e9e8b')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 0755 tilemaker $pkgdir/usr/bin/tilemaker
  install -Dm 0644 LICENCE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
