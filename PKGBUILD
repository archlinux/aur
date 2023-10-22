# Maintainer: Equationzhao <equationzhao at foxmail dot com>
pkgname='g-ls'
pkgver=0.22.2
pkgrel=1
pkgdesc='a powerful ls in golang'
arch=('x86_64')
url='https://github.com/Equationzhao/g'
license=('MIT')
makedepends=('go')
backup=("etc/$pkgname/config.conf")
source=("g-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1c8bee104db4cfabf35cc03301bca52d6467bcd85196afc70aa86d891a05e5b0')

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
