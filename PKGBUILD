# Maintainer: zjuyk <ownbyzjuyk@gmail.com>
pkgname=mdbook-toc
pkgver=0.11.2
pkgrel=2
pkgdesc="A preprocessor for mdbook to add inline Table of Contents support."
arch=('x86_64')
url="https://github.com/badboy/mdbook-toc"
license=('MPL')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz"::$url/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('39a1cbf3d50d19c0a304c41408439b6f3a053bcfedb1958af00cf20b8daa8cc7')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release
}

check() {
	cd "$pkgname-$pkgver"
	cargo test --release
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
