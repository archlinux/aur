# shellcheck disable=SC2148
# shellcheck disable=SC2034

# Maintainer: juanvel400 <juanvel400@proton.me>
pkgname=n191
pkgver=1.0.1
pkgrel=1
pkgdesc="A Microsoft Edit fork"
arch=('x86_64')
url="https://github.com/juanvel4000/n191"
license=('MIT')
makedepends=('rust' 'rust-src')
source=("https://github.com/juanvel4000/n191/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('cec58134fcff98350284b21933e75ca527e1e34694cbcaa94dc628fb8c10859d')



build() {
	cd "$pkgname-$pkgver"
	RUSTC_BOOTSTRAP=1 cargo build --config .cargo/release.toml --release
}


package() {
	cd "$pkgname-$pkgver"
    install -Dm755 target/release/n191 "$pkgdir/usr/bin/n191"

}