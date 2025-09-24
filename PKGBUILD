# Maintainer: Rui Jiang <me@ruijiang.me>
pkgname=noxdir
pkgver=0.8.0
pkgrel=1
pkgdesc="Terminal utility for visualizing file system usage."
arch=('x86_64')
url="https://github.com/crumbyte/noxdir"
license=('MIT')
provides=("$pkgname")
conflicts=("$pkgname")
depends=('go')

source=("$pkgname-$pkgver.tar.gz::https://github.com/crumbyte/noxdir/archive/v$pkgver.tar.gz")
sha256sums=('8b8beecdef57f8fd84e424c3619fc5b62004aec9601d7a16f12d9429efe43e03')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  go build -o "$pkgname"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
