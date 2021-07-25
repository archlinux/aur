pkgname=rust-analyzer-nightly-bin
pkgver=20210725
pkgrel=1
pkgdesc="An experimental Rust compiler front-end for IDEs (nightly)"
arch=('x86_64' 'i686')
url="https://github.com/rust-analyzer/rust-analyzer"
license=('MIT')
depends=()
makedepends=()
optdepends=()
provides=('rust-analyzer')
conflicts=('rust-analyzer')
source=(rust-analyzer.gz::https://github.com/rust-analyzer/rust-analyzer/releases/download/nightly/rust-analyzer-x86_64-unknown-linux-gnu.gz)
sha256sums=('SKIP')

pkgver() {
    chmod +x rust-analyzer
    ./rust-analyzer --version | cut -d' ' -f3 | sed 's/-//g'
}

package() {
	install -D -m755 "$srcdir/rust-analyzer" "$pkgdir/usr/bin/rust-analyzer"
}
