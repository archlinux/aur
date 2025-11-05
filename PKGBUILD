# Maintainer: Rui Jiang <me@ruijiang.me>
pkgname=noxdir
pkgver=0.10.0
pkgrel=1
pkgdesc="Terminal utility for visualizing file system usage."
arch=('x86_64')
url="https://github.com/crumbyte/noxdir"
license=('MIT')
provides=("$pkgname")
conflicts=("$pkgname")
depends=('go')

source=("$pkgname-$pkgver.tar.gz::https://github.com/crumbyte/noxdir/archive/v$pkgver.tar.gz")
sha256sums=('33067d75ce8bc26241f81a75af4347efc649ce23f8441e5b4d56ea56dda35d08')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  go build -o "$pkgname"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
