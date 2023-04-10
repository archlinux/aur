# Maintainer: wilke
pkgname=harsh
pkgver=0.8.25
pkgrel=0
pkgdesc="CLI habit tracking for geeks"
arch=('any')
url="https://github.com/wakatara/harsh"
license=('MIT')

makedepends=('go>=1.14')

sha256sums=('465feb205e3d11b2861d525c8d794e8583af509167b8af95e2b64b778f8d566e')

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
