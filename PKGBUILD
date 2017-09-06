# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>

pkgname=thunder
pkgver=0.1
pkgrel=1
pkgdesc="An interactive shell for BoltDB files"
arch=('x86_64')
url="https://github.com/muesli/thunder"
license=('MIT')
makedepends=('go')
source=("https://github.com/muesli/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('fdb58026914f53c60dbe92e3c4c11e3e803ac2cc02833c80273febdc274c4468')

prepare() {
    cd "$pkgname-$pkgver"
    GOPATH=`pwd` go get -d -v
}

build() {
    cd "$pkgname-$pkgver"
    GOPATH=`pwd` go build
}

package() {
    cd "$pkgname-$pkgver"

    # Install binary
    install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
    # Copy License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

