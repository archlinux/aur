# Maintainer: Justin McAteer <ru5j4r0@google.com>
pkgname=pyflow
pkgver=0.2.9
pkgrel=1
pkgdesc="An installation and dependency system for Python"
arch=('x86_64' 'i686')
url="https://github.com/David-OConnor/pyflow"
license=('MIT')
depends=('xz')
makedepends=('cargo')
checkdepends=('cargo')
changelog=CHANGELOG.md
source=("https://codeload.github.com/David-OConnor/pyflow/tar.gz/0.2.9")
b2sums=(ccccd20122930acbe5c98b77deaf9cef5943b86a2f7b788939cfa931adc19ac8afec70ce46f884880de04fcf6edb8c5df8a1eb5ec6c4046897dfb0c4543e1f17)

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
