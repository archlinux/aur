# Maintainer: Creptic <creptics@gmail.com>
pkgname=qbtctl
pkgver=1.5.0
pkgrel=1
pkgdesc="Minimal, ultra-fast command-line interface for controlling a torrent in qBittorrent via its Web API."
arch=('x86_64')
url="https://github.com/creptic/qbtctl"
license=('GPL3')
depends=('curl' 'zlib' 'libsodium')
makedepends=('gcc' 'make')
source=("https://github.com/creptic/qbtctl/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('16b23fd444fd532ebfd55439aac1fb0e6c03eee097a51c5a0877b33a843c4d39')
options=('!debug')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make clean
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 qbtctl "$pkgdir/usr/bin/qbtctl"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 INSTALL.txt "$pkgdir/usr/share/doc/$pkgname/INSTALL.txt"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
