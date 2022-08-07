# Maintainer: wilke
pkgname=harsh
pkgver=0.8.18
pkgrel=0
pkgdesc="CLI habit tracking for geeks"
arch=('any')
url="https://github.com/wakatara/harsh"
license=('MIT')

makedepends=('go>=1.19')

sha256sums=('dae554a34ce1bd94160ff37ce7cec8c3552e5cf5e135b25e1cee996891f4f9ff')

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
