# Maintainer: wilke
pkgname=harsh
pkgver=0.8.20
pkgrel=0
pkgdesc="CLI habit tracking for geeks"
arch=('any')
url="https://github.com/wakatara/harsh"
license=('MIT')

makedepends=('go>=1.19')

sha256sums=('130c1ce838bcda920b3271e8b018c3bc1529b7ddf71195889e50f0d25af0ae96')

source=("$pkgname-$pkgver.tgz::https://github.com/wakatara/harsh/archive/refs/tags/v$pkgver.tar.gz")

build() {
    cd "$pkgname-$pkgver"
    go get ./...
    go build -o harsh .
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 harsh -t"$pkgdir/usr/bin/"
}
