# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>

pkgname=duf
pkgver=0.2.0
pkgrel=1
pkgdesc="Disk Usage/Free Utility"
arch=('x86_64' 'i686')
url="https://github.com/muesli/duf"
license=('MIT')
makedepends=('go')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('928f0074bfbec3b928c4c8411f800f4170eb046e9224e94b83f3c85c63b6531b')

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
