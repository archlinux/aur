 # Maintainer: Mihajasoa <mihajasoaalain85@gmail.com>
  pkgname=inspire
  pkgver=0.1.0
  pkgrel=1
  pkgdesc="CLI that prints a random inspirational quote"
  arch=('x86_64')
  url="https://github.com/mihajasoaalain/inspire"
  license=('MIT')
  makedepends=('go')
  source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
  sha256sums=('d3b9ff60caed1392be6d706304aff0cc4b9894750d52cbe9b3f130769a681045')

  build() {
    cd "$pkgname-$pkgver"
    export CGO_ENABLED=0
    go build -o "$pkgname" .
  }

  package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  }
