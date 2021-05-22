pkgname=rust-analyzer-nightly-bin
pkgver=20210522
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
source=(https://github.com/rust-analyzer/rust-analyzer/releases/download/nightly/rust-analyzer-linux.gz)
sha256sums=('SKIP')

pkgver() {
    chmod a+x rust-analyzer-linux
    ./rust-analyzer-linux --version | cut -d' ' -f3 | sed 's/-//g'
}

package() {
	install -D -m755 "$srcdir/rust-analyzer-linux" "$pkgdir/usr/bin/rust-analyzer"
}
