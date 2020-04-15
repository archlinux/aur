# Maintainer: Rustam Aliyev <ru5j4r0@google.com>
pkgname=pyflow
pkgver=0.2.5.1
pkgrel=1
pkgdesc="An installation and dependency system for Python"
arch=('x86_64' 'i686')
url="https://github.com/David-OConnor/pyflow"
license=('MIT')
depends=('xz')
makedepends=('cargo')
checkdepends=('cargo')
changelog=CHANGELOG.md
source=("https://github.com/David-OConnor/pyflow/archive/0.2.5.1.tar.gz")
b2sums=(d1b97ad55a7571aa8dfb6e1cd863d49207185a1895957b5776f710fa5b60474c27da120907b4d8973ca7c59ce22ef8fa67dc66a898bdb381c32fa8aedb29ec07)
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
