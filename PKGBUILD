pkgname=rust-analyzer-git
pkgver=rust.analyzer.cf4d4f646.2021.05.09.nightly
pkgrel=1
epoch=1
pkgdesc="An experimental Rust compiler front-end for IDEs"
arch=('x86_64' 'i686')
url="https://github.com/rust-analyzer/rust-analyzer"
license=('MIT')
depends=()
makedepends=()
optdepends=()
provides=('rust-analyzer')
conflicts=('rust-analyzer')
source=(https://github.com/rust-analyzer/rust-analyzer/releases/download/nightly/rust-analyzer-linux.gz)
sha256sums=('87235e0d1884803404fddac2fbdcc8a21fd2060bf2238105325a76d27df455a3')

pkgver() {
    chmod a+x rust-analyzer-linux
    ./rust-analyzer-linux --version | sed 's/[ -]/./g'
}

package() {
	install -D -m755 "$srcdir/rust-analyzer-linux" "$pkgdir/usr/bin/rust-analyzer"
}
