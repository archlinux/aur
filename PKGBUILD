# Maintainer: Rui Jiang <me@ruijiang.me>
pkgname=noxdir
pkgver=1.2.0
pkgrel=1
pkgdesc="Terminal utility for visualizing file system usage."
arch=('x86_64')
url="https://github.com/crumbyte/noxdir"
license=('MIT')
provides=("$pkgname")
conflicts=("$pkgname")
depends=('go')

source=("$pkgname-$pkgver.tar.gz::https://github.com/crumbyte/noxdir/archive/v$pkgver.tar.gz")
sha256sums=('974a94c3fc2122e949731a40d0d3ac43a719eccedfcb33dddb2474d1818c469f')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  go build -o "$pkgname"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
