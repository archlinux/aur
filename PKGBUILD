# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=zlob
pkgver=1.2.8
pkgrel=1
pkgdesc='A fast SIMD-accelerated glob pattern matcher'
url='https://github.com/dmtrKovalenko/zlob'
arch=('x86_64')
license=('MIT')
makedepends=('zig')
provides=('zlob')
conflicts=('zlob-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgname_$pkgver.tar.gz")
sha256sums=('307c43b480b1ea03e67ba1f37b8b35f67c4707398b6fa08c68a15581fa069366')

build() {
    cd "$pkgname-$pkgver"
    zig build -Doptimize=ReleaseSafe
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 zig-out/bin/zlob "$pkgdir/usr/bin/zlob"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
