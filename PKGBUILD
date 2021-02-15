# Maintainer: Ben Aaron Goldberg <ben@benaaron.dev>

pkgname=fddf
pkgver=1.7.0
pkgrel=1
pkgdesc="Fast data dupe finder"
arch=('x86_64' 'i686' 'arm' 'armv7h' 'aarch64')
url="https://github.com/birkenfeld/fddf"
license=('MIT' 'APACHE')
source=("https://github.com/birkenfeld/fddf/archive/v${pkgver}.tar.gz")
makedepends=('rust' 'cargo')
sha256sums=("44ef9630376dcaa3b1c13efff445eb838ee2f909011224dcfd40beda6413c4eb")

build() {
	tar -xf v${pkgver}.tar.gz
	cd "$srcdir/$pkgname-$pkgver"
	cargo build --release
}

package() {
	install -D -m755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" \
		"$pkgdir/usr/bin/$pkgname"

	install -D -m644 "$srcdir/$pkgname-$pkgver/LICENSE-APACHE" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
	install -D -m644 "$srcdir/$pkgname-$pkgver/LICENSE-MIT" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
