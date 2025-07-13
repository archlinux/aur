# Maintainer: Luciano Ciccariello <xeeynamo@hotmail.com>

pkgname=gobindiff
pkgver=0.2
pkgrel=1
pkgdesc="Highlight differences between multiple files with a hex grid"
arch=('x86_64')
url="https://github.com/Xeeynamo/gobindiff"
license=('MIT')
depends=()
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7ef9b967183ad340e60c750c2996df1ed45d36ad51386d27a8d18967b58f8cc4')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make bin/gobindiff-linux-amd64
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 bin/gobindiff-linux-amd64 "$pkgdir/usr/bin/gobindiff"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
