pkgname=rust-analyzer-nightly-bin
pkgver=0.4.1428standalone
pkgrel=1
pkgdesc="An experimental Rust compiler front-end for IDEs (nightly)"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/rust-analyzer/rust-analyzer"
license=('MIT')
depends=()
makedepends=()
optdepends=()
provides=('rust-analyzer')
conflicts=('rust-analyzer')
source_x86_64=(rust-analyzer.gz::https://github.com/rust-lang/rust-analyzer/releases/download/nightly/rust-analyzer-x86_64-unknown-linux-gnu.gz)
source_i686=(rust-analyzer.gz::https://github.com/rust-lang/rust-analyzer/releases/download/nightly/rust-analyzer-x86_64-unknown-linux-gnu.gz)
source_aarch64=(rust-analyzer.gz::https://github.com/rust-lang/rust-analyzer/releases/download/nightly/rust-analyzer-aarch64-unknown-linux-gnu.gz)
sha256sums_x86_64=('SKIP')
sha256sums_i686=('SKIP')
sha256sums_aarch64=('SKIP')

pkgver() {
    chmod +x rust-analyzer
    ./rust-analyzer --version | cut -d' ' -f2 | tr -d "(-"
}

package() {
	install -D -m755 "$srcdir/rust-analyzer" "$pkgdir/usr/bin/rust-analyzer"
}
