# Maintainer: Henry Nelson <hcnelson99@gmail.com>
pkgname=zig-static
pkgver=0.10.0
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
md5sums_x86_64=('a73088e3806e4973f241665f73f23376')
md5sums_aarch64=('9b3cfb88e300071ac3a3f273abd158e0')

package() {
    cd "$srcdir/zig-linux-${CARCH}-$pkgver"
    install -D zig "$pkgdir/usr/bin/zig"
    install -D LICENSE "$pkgdir/usr/share/licenses/zig/LICENSE"
    cp -r lib "$pkgdir/usr"
    install -d "$pkgdir/usr/share/doc"
    cp -r doc "$pkgdir/usr/share/doc/zig"
}
