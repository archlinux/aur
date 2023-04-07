# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=svls
pkgver=0.2.8
pkgrel=1
epoch=
pkgdesc="SystemVerilog language server"
arch=('x86_64')
url="https://github.com/dalance/svls"
license=('MIT')
groups=()
depends=('gcc-libs')
makedepends=('cargo')
checkdepends=()
optdepends=()
provides=()
conflicts=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('cfdec9756252a2b1921e55294a8b590354b595d192fd1f6c844a98b9d0f05bac')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	cargo build --release --locked --all-features --target-dir=target
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	install -Dm755 target/release/$pkgname -t "$pkgdir/usr/bin"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
