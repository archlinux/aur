# Maintainer: Andrew Ryan <dnrops@outlook.com>
#

pkgname=generate-app-icons
_pkgname="generate-app-icons"
pkgver=1.0.0
pkgrel=1
pkgdesc="A CLI for generate app icons for ios ipad Watch Mac Android devices"
url="https://dnrops.gitee.io"
license=("MIT")
arch=("any")
provides=($_pkgname)
conflicts=($_pkgname)
source=("$pkgname::git+https://gitlab.com/andrew_ryan/generate-app-icons")
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
