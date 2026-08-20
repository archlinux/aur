# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=lexicmap
pkgver=0.9.0
pkgrel=2
pkgdesc="Efficient sequence alignment against millions of prokaryotic and viral genomes"
arch=('x86_64')
url="https://github.com/shenwei356/LexicMap"
license=('MIT')
makedepends=('go')
conflicts=('lexicmap-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('977a8fdb86a8ed5e8304b89d5a432536e3c42681edb5b9e3018e687be59d918f')

build() {
  cd "$srcdir/LexicMap-$pkgver"
  go build -trimpath -o "$srcdir/$pkgname" "./$pkgname"
}

package() {
  cd "$srcdir/LexicMap-$pkgver"
  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
