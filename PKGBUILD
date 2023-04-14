# Maintainer: wilke
pkgname=harsh
pkgver=0.8.26
pkgrel=0
pkgdesc="CLI habit tracking for geeks"
arch=('any')
url="https://github.com/wakatara/harsh"
license=('MIT')

makedepends=('go>=1.14')

sha256sums=('33dfee7c15dab54e2d4e90355164164ba93190963fd9d8189e02497d65303b8e')

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
