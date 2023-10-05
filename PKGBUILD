# Maintainer: Equationzhao <equationzhao at foxmail dot com>
pkgname='g-ls'
pkgver=0.18.1
pkgrel=1
pkgdesc='a powerful ls in golang'
arch=('x86_64')
url='https://github.com/Equationzhao/g'
license=('MIT')
makedepends=('go')
backup=("etc/$pkgname/config.conf")
source=("g-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d3ab13e4464da8923d95d9587d0b4ef2e0cedff2fafe3098cc8fa632ee4873ab')

build() {
    cd "$srcdir/g-$pkgver"
    go build -ldflags="-s -w" -o g
}

package() {
    cd "$srcdir/g-$pkgver"
    mkdir -p "$pkgdir/usr/bin"
    install -m755 g "$pkgdir/usr/bin"
    cd man
    install -Dm644 g.1.gz "$pkgdir/usr/share/man/man1/g.1.gz"
}
