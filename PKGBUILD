# Maintainer: Yurenev Nikolay <yurnik2004 at gmail.com>

pkgname='zvm'
pkgver='0.0.1_alpha'
pkgrel='1'
pkgdesc='Version manager for Zig compilers'
arch=('x86_64')
license=('MIT')
makedepnds=()
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/tristanisham/zvm/archive/refs/tags/v0.0.1-alpha.tar.gz"
    'https://ziglang.org/download/0.10.0/zig-linux-x86_64-0.10.0.tar.xz'
)
md5sums=(
    'fef62bef20d0dbc1b090156d8ff62369'
    'a73088e3806e4973f241665f73f23376'
)

build() {
    cd zvm-0.0.1-alpha
    ../zig-linux-x86_64-0.10.0/zig build
}

package() {
    cd zvm-0.0.1-alpha
    mkdir -p "$pkgdir/usr/bin"
    cp zig-out/bin/zvm "$pkgdir/usr/bin"
}
