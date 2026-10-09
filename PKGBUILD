# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=seqkit
pkgver=2.14.0
pkgrel=1
pkgdesc="Cross-platform and ultrafast toolkit for FASTA/Q file manipulation in Golang"
arch=('x86_64')
url="https://github.com/shenwei356/seqkit"
license=('MIT')
makedepends=('go')
conflicts=('seqkit-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7df95904ce438c1a1a7b1fc06f20479a169e69209ac59abae8e80c60a1e65d60')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  go build -trimpath -buildvcs=false -o "$srcdir/$pkgname" "./$pkgname"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
