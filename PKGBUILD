pkgname=svlint
pkgver=0.7.2
pkgrel=1
pkgdesc="SystemVerilog linter compliant with IEEE1800-2017"
arch=('x86_64')
url="https://github.com/dalance/svlint"
license=('MIT')
groups=()
depends=('gcc-libs')
makedepends=('cargo')
checkdepends=()
optdepends=()
provides=()
conflicts=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('08294af18f775c81a0701e398d90e73d708f032c12baf575442ac4dc0cdd2d33')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	cargo build --release --all-features --target-dir=target
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	install -Dm755 target/release/$pkgname -t "$pkgdir/usr/bin"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
