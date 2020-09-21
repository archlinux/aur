# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>

pkgname=duf
pkgver=0.1.0
pkgrel=1
pkgdesc="Disk Usage/Free Utility"
arch=('x86_64' 'i686')
url="https://github.com/muesli/duf"
license=('MIT')
makedepends=('go')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('ba2cfc2857cc6e355e8175b3dd0f3719680ec2b2cb0eaf71de4876e2b1722c3b')

build() {
    cd "$pkgname-$pkgver"
    go build \
        -trimpath \
        -ldflags "-X main.Version=$pkgver -extldflags $LDFLAGS" \
        -o "duf" .
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "duf" "$pkgdir/usr/bin/duf"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=4 sw=4 et:
