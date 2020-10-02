# Maintainer: Justin McAteer <ru5j4r0@google.com>
pkgname=pyflow
pkgver=0.2.8
pkgrel=1
pkgdesc="An installation and dependency system for Python"
arch=('x86_64' 'i686')
url="https://github.com/David-OConnor/pyflow"
license=('MIT')
depends=('xz')
makedepends=('cargo')
checkdepends=('cargo')
changelog=CHANGELOG.md
source=("https://github.com/David-OConnor/pyflow/archive/0.2.8.tar.gz")
b2sums=(b9ac8dc7c29da4cd4fd563651ccf63d54fdfd84067fa71f77de6fc323c32971c03cb35a9d93fc5c681920eb9068a7aaf1d2c8a6202e9e30a81ddd8c48aed9ac2)

build() {
	cd "$pkgname-$pkgver"
	cargo build --release --locked
}

check() {
	cd "$pkgname-$pkgver"
	cargo test --release --locked
}

package() {
	cd "$pkgname-$pkgver"
	install -Dt "$pkgdir/usr/bin" target/release/pyflow
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
