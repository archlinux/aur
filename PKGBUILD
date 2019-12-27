# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>
# Contributor: Stephen Gregoratto <dev@sgregoratto.me>

pkgname=glow
pkgver=0.1.3
pkgrel=3
pkgdesc="Markdown renderer for the CLI"
arch=('x86_64' 'i686')
url="https://github.com/charmbracelet/glow"
license=('MIT')
makedepends=('go')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('3c7e531bb2b04c62f302dd84547493c73fa1fc5c83282fa23405a5da82182797')

build() {
    cd "$pkgname-$pkgver"
    go build \
        -trimpath \
        -ldflags "-X main.Version=$pkgver -extldflags $LDFLAGS" \
        -o "glow" .
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "glow" "$pkgdir/usr/bin/glow"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=4 sw=4 et:
