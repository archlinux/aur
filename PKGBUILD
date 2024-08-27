# Maintainer: Dion Vu
pkgname=spogo
pkgver=0.1.1
pkgrel=1
pkgdesc="A command-line tool with Spotify integration"
arch=('aarch64' 'x86_64')
url="https://github.com/dionvu/spogo"
license=('MIT')
depends=('go')
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dionvu/spogo/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "spogo-$pkgver/cmd/spogo"
    go build -o spogo main.go
}

package() {
    cd "spogo-$pkgver/cmd/spogo"
    install -Dm755 spogo "$pkgdir/usr/bin/spogo"
}
