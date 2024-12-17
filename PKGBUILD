# Maintainer: Jamison Lahman <jamison@lahman.dev>

pkgname=nature-sounds
pkgver=0.1.2
pkgrel=2
pkgdesc="A lightweight, nature sounds player for the command-line."
arch=('x86_64' 'aarch64')
url="https://github.com/jmelahman/nature-sounds"
license=('MIT')
depends=('alsa-utils')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jmelahman/nature-sounds/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a76e78f4491ffc911e655dfe9ad3c7ccd07988c8ceb27504d93f41c7d3a802df')

build() {
    cd "$srcdir/$pkgname-$pkgver" || exit
    go build -ldflags="-X main.version=v$pkgver -s -w" -o nature-sounds
}

package() {
    cd "$srcdir/$pkgname-$pkgver" || exit
    install -Dm755 nature-sounds "$pkgdir/usr/bin/nature-sounds"
}
