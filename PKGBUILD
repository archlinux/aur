# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=taxonkit
pkgver=0.20.0
pkgrel=2
pkgdesc="Cross-platform and efficient toolkit for rapid taxonomic operations on BARCODE, ASV, OTU or any biological sequences with taxonomy annotation"
arch=('x86_64')
url="https://github.com/shenwei356/taxonkit"
license=('MIT')
makedepends=('go')
conflicts=('taxonkit-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('eb5a6641264f84997eaa22df7c9cad735c100b434dfd62c2560aba78164f34f6')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  go build -trimpath -o "$srcdir/$pkgname" "./$pkgname"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
