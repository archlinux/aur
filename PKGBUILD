# Maintainer: Rui Jiang <me@ruijiang.me>
pkgname=noxdir
pkgver=0.9.0
pkgrel=1
pkgdesc="Terminal utility for visualizing file system usage."
arch=('x86_64')
url="https://github.com/crumbyte/noxdir"
license=('MIT')
provides=("$pkgname")
conflicts=("$pkgname")
depends=('go')

source=("$pkgname-$pkgver.tar.gz::https://github.com/crumbyte/noxdir/archive/v$pkgver.tar.gz")
sha256sums=('e552ef8c1a8cb4bb47ddc65fa17c37e8725ea33ff0fc5499a32182f25e65db74')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  go build -o "$pkgname"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
