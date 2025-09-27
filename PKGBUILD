# Maintainer: John Gitahi <opl.to/gth>
pkgname=yoyo
pkgver=0.0
pkgrel=1
pkgdesc="A simple local password manager written in C"
arch=('x86_64')
url="https://github.com/johngitahi/yoyo"
license=("BSD-3")
depends=('jansson' 'libsodium')
makedepends=('clang')
source=("pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    clang -o yoyo yoyo.c common.c -ljansson -lsodium
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 yoyo "$pkgdir/usr/bin/yoyo"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
