# Maintainer: Chris Lahaye <mail@chrislahaye.com>

pkgname=cfn-teleport
pkgver=0.3.0
pkgrel=1
pkgdesc="A command-line tool which can move CloudFormation resources between stacks"
arch=('x86_64')
url="https://github.com/udondan/cfn-teleport"
license=('APACHE')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('e585cf39255bb20a452086b70d11615d51910293e070e3ffc2301b55c748cba02cb37fd2a6345724421726015a0a233ebdf8a7d51581826e8e3619e7e6297fff')

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    make release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
