# Maintainer: Rustam Aliyev <ru5j4r0@google.com>
pkgname=pyflow
pkgver=0.2.4
pkgrel=1
pkgdesc="An installation and dependency system for Python"
arch=('x86_64' 'i686')
url="https://github.com/David-OConnor/pyflow"
license=('MIT')
depends=('xz')
makedepends=('cargo')
checkdepends=('cargo')
changelog=CHANGELOG.md
source=("https://github.com/David-OConnor/pyflow/archive/0.2.4.tar.gz")
b2sums=(75cf6463928ed34ac9234973d00ea9b087df8b6fb0aff75e11b99b91eb1bef76c32c898e81d9f5dff5350efbf7d51c816200cc89052837ce54c2a875c2a126f5)
validpgpkeys=(B3D4420410BC16F84C358DF6AF36488D565A347A)

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
