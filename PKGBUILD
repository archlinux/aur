# Maintainer: agony <27015 at riseup dot net>
# Contributor: zjuyk <ownbyzjuyk@gmail.com>

pkgname=mdbook-toc
pkgver=0.15.4
pkgrel=1
pkgdesc="A preprocessor for mdbook to add inline Table of Contents support."
arch=('x86_64')
url="https://github.com/badboy/mdbook-toc"
license=('MPL-2.0')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('bdac90076df07368f91e8ed7d474ba5be3e887725baed1ef4e9bf3352a70c8cd')

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
