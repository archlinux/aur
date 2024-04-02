# shellcheck shell=bash disable=SC2034,SC2154
pkgname=typstfmt
pkgver=0.2.9
pkgrel=1
pkgdesc="formatter for the Typst language"
arch=(i686 x86_64 arm aarch64)
url=https://github.com/astrale-sharp/$pkgname
makedepends=(rust)
license=(GPL3)
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('fa24ee1705ff5fec4db45e301d38439d0bd3d6d4ee04b280ba997b2f94ba16d9')

build() {
	cd "$pkgname-$pkgver" || return 1

	cargo build --release
}

package() {
	cd "$pkgname-$pkgver" || return 1

	install -D "target/release/$pkgname" -t "$pkgdir/usr/bin"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
