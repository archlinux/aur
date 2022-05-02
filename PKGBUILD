# Maintainer: krisdoodle45
pkgname=harsh
pkgver=0.8.16
pkgrel=1
pkgdesc="CLI habit tracking for geeks"
arch=('any')
url="https://github.com/wakatara/harsh"
license=('MIT')

makedepends=('go>=1.18')

source=("$pkgname-$pkgver.tgz::https://github.com/wakatara/harsh/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e878ba9e369d21525f2c2cb32be0589ca3fef5282373ea38f5cbb247a5a4a862')

build() {
    cd "$pkgname-$pkgver"
    go get ./...
    go build -buildvcs=false -o harsh .
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 harsh -t"$pkgdir/usr/bin/"
}
