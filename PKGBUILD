# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=seqkit
pkgver=2.13.0
pkgrel=2
pkgdesc="Cross-platform and ultrafast toolkit for FASTA/Q file manipulation in Golang"
arch=('x86_64')
url="https://github.com/shenwei356/seqkit"
license=('MIT')
makedepends=('go')
conflicts=('seqkit-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('55405cc338962f770279d718c1dabec293a51dde4989c0c2590da3c303105471')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  go build -trimpath -o "$srcdir/$pkgname" "./$pkgname"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
