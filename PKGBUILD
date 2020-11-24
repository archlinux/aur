# Maintainer: Dominic Meiser [git at msrd0 dot de]

pkgname=cargo-readme
pkgver=3.2.0
pkgrel=1
pkgdesc='A cargo subcommand to generate README.md content from doc comments'
arch=('x86_64')
url='https://github.com/livioribeiro/cargo-readme/blob/master/README.md'
license=('Apache-2.0' 'MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=(
	"cargo-readme.tar.gz::https://crates.io/api/v1/crates/cargo-readme/$pkgver/download"
	"https://github.com/livioribeiro/cargo-readme/raw/a9f80759ec55717307d39cc98d3fd919b1fbe424/LICENSE-MIT"
)
sha512sums=('49fdfcde0913e330e4f79e56d41ff675e2a1b0d0e11b09d8b3db348e11fabe9024ec71eeef72465113e92aa49324b6d5ab5e7607e196d35730d4fe059feeb5e9'
            'd3fa97aa6ca3da8246b20d0965c3f05d9640fe7a50d92d61e27a759ea4710df2af725aeb70df5bbcc5e4f0503db9f4f5f7ecbc2a332d3b73afd108ed7d1b86fc')

build() {
	cd "$srcdir/cargo-readme-$pkgver"
	cargo build --release
}

package() {
	cd "$srcdir/cargo-readme-$pkgver"
	install -Dm755 "target/release/cargo-readme" -t "$pkgdir/usr/bin"
	install -Dm644 "$srcdir/LICENSE-MIT" -t "$pkgdir/usr/share/licenses/$pkgname"
}
