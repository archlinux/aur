# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=svls
pkgver=0.1.17
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
sha256sums=('193ffaea30c82f45f00ad335f41417615de0678dfed09588a803430a4e456e7a')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	cargo build --release --locked --all-features --target-dir=target
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	install -Dm755 target/release/$pkgname -t "$pkgdir/usr/bin"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
