# Maintainer: Lon60 https://github.com/Lon60/sysfail/tree/v1.0.0
pkgname=sysfail
pkgver=1.0.0
pkgrel=1
pkgdesc="Linux System Failure Simulator - Realistic kernel panic and emergency shell prank tool"
arch=('x86_64' 'aarch64')
url="https://github.com/Lon60/sysfail"
license=('MIT')
depends=()
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ab38ec3259fa2314e09884c2ad83313b22a09a4c99800c2d1fe97d17200754de')

build() {
    cd "$pkgname-$pkgver"
    export CGO_ENABLED=0
    export GOFLAGS="-buildmode=pie -trimpath"
    make build
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}