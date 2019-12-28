# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>
# Contributor: Stephen Gregoratto <dev@sgregoratto.me>

pkgname=glow
pkgver=0.1.5
pkgrel=1
pkgdesc="Markdown renderer for the CLI"
arch=('x86_64' 'i686')
url="https://github.com/charmbracelet/glow"
license=('MIT')
makedepends=('go')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('8d892ef39d866ddc74dacebed92c9a08c063be0ca1e23e57bc041b8c039ef610')

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
