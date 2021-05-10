pkgname=rust-analyzer-nightly-bin
pkgver=rust.analyzer.fd109fb58.2021.05.10.nightly
pkgrel=1
epoch=1
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
    ./rust-analyzer-linux --version | sed 's/[ -]/./g'
}

package() {
	install -D -m755 "$srcdir/rust-analyzer-linux" "$pkgdir/usr/bin/rust-analyzer"
}
