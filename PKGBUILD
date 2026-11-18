# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=lexicmap
pkgver=0.10.1
pkgrel=1
pkgdesc="Efficient sequence alignment against millions of prokaryotic and viral genomes"
arch=('x86_64')
url="https://github.com/shenwei356/LexicMap"
license=('MIT')
makedepends=('go')
conflicts=('lexicmap-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4245698c69cac3c88f2aecf4013e6626d6c8eab2dd77c7d9f08e22814db44649')

build() {
  cd "$srcdir/LexicMap-$pkgver"
  go build -trimpath -buildvcs=false -o "$srcdir/$pkgname" "./$pkgname"
}

package() {
  cd "$srcdir/LexicMap-$pkgver"
  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
