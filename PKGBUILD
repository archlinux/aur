# Maintainer: Dion Vu
pkgname=spogo
pkgver=0.2.0
pkgrel=1
pkgdesc="A Spotify terminal interface with clean aesthetic"
arch=('aarch64' 'x86_64')
url="https://github.com/dionvu/spogo"
license=('MIT')
depends=('go')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dionvu/spogo/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "spogo-$pkgver/"
    go build -o spogo main.go
}

package() {
    cd "spogo-$pkgver/"
    install -Dm755 spogo "$pkgdir/usr/bin/spogo"
}
