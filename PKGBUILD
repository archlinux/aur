# Maintainer: Henry Nelson <hcnelson99@gmail.com>
pkgname=zig-static
pkgver=0.9.1
pkgrel=1
epoch=
pkgdesc="robust, optimal, and clear programming language"
arch=('x86_64' 'aarch64')
url="https://ziglang.org/"
license=('MIT')
depends=()
makedepends=()
options=('!strip')
provides=('zig')
conflicts=('zig')
source_x86_64=("https://ziglang.org/download/$pkgver/zig-linux-x86_64-$pkgver.tar.xz")
source_aarch64=("https://ziglang.org/download/$pkgver/zig-linux-aarch64-$pkgver.tar.xz")
md5sums_x86_64=('01daf426d9e1c86aad6e4b26351e1ae8')
md5sums_aarch64=('d7b665a034281572664ed73fc3ec6684')

package() {
    cd "$srcdir/zig-linux-${CARCH}-$pkgver"
    install -D zig "$pkgdir/usr/bin/zig"
    install -D LICENSE "$pkgdir/usr/share/licenses/zig/LICENSE"
    cp -r lib "$pkgdir/usr"
    install -d "$pkgdir/usr/share/doc"
    cp -r doc "$pkgdir/usr/share/doc/zig"
}
