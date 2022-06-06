# Maintainer: wilke
pkgname=harsh
pkgver=0.8.17
pkgrel=2
pkgdesc="CLI habit tracking for geeks"
arch=('any')
url="https://github.com/wakatara/harsh"
license=('MIT')

makedepends=('go>=1.18')

source=("$pkgname-$pkgver.tgz::https://github.com/wakatara/harsh/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('30b9b19e4764a9453d0b3702ec2f65577daf7a48ccbcfa6441bdb2b979b994d2')

build() {
    cd "$pkgname-$pkgver"
    go get ./...
    go build -o harsh .
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 harsh -t"$pkgdir/usr/bin/"
}
