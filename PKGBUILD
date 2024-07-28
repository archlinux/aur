# Maintainer: Achno <logiaTemp@proton.me>
pkgname=gowall
pkgver=0.1.0
pkgrel=1
pkgdesc="A tool to convert a Wallpaper's color scheme - palette"
arch=('x86_64')
url="https://github.com/Achno/gowall"
license=('MIT')
depends=('glibc')
makedepends=('go>=1.22')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Achno/gowall/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')


build() {

  cd "$srcdir/$pkgname-$pkgver"
  export GOPATH="$srcdir/go"
  export GO111MODULE=on
  go mod download
  go build -o gowall
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 gowall "$pkgdir/usr/bin/gowall"
}
