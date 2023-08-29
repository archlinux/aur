# Maintainer: Andrew Ryan <dnrops@outlook.com>
#

pkgname=rust-aur-git
_pkgname="rust-aur"
pkgver=1.0.0
pkgrel=1
pkgdesc="This is rust CLI for fast create aur cli for rust project"
url="https://dnrops.gitee.io"
license=("MIT")
arch=("x86_64")
provides=($_pkgname)
conflicts=($_pkgname)
source=("$pkgname::git+https://gitcode.net/dnrops/rust-aur-git.git")
sha256sums=('SKIP')

build() {
	  cd "$srcdir/$pkgname"
    export CARGO_TARGET_DIR=target
    cargo fetch --target "$CARCH-unknown-linux-gnu"
    cargo build --frozen --release
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm 755 "target/release/$_pkgname" -t "$pkgdir/usr/bin/"
}
