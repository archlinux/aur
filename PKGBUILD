# Maintainer: Mihajasoa <mihajasoaalain85@gmail.com>
pkgname=inspire
pkgver=0.2.0
pkgrel=1
pkgdesc="CLI that prints a random inspirational quote"
arch=('x86_64')
url="https://github.com/MihajasoaAlain/inspire"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2b2638e8d51b70b47be2fe2ee8fb08abd8567e8ac639f5a3c91abd2b629e0603')

build() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=0
  go build -o "$pkgname" .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
