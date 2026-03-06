# Maintainer: Rui Jiang <me@ruijiang.me>
pkgname=noxdir
pkgver=1.1.0
pkgrel=1
pkgdesc="Terminal utility for visualizing file system usage."
arch=('x86_64')
url="https://github.com/crumbyte/noxdir"
license=('MIT')
provides=("$pkgname")
conflicts=("$pkgname")
depends=('go')

source=("$pkgname-$pkgver.tar.gz::https://github.com/crumbyte/noxdir/archive/v$pkgver.tar.gz")
sha256sums=('c88b8e64628b42be513424b37335d72438535cfa5545dcc53058c871bbab2bef')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  go build -o "$pkgname"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
