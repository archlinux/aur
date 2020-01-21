# Maintainer Jiuyang Liu <liujiuyang1994@gmail.com>

pkgname=svd2rust
pkgdesc="Generate Rust register maps (\`struct\`s) from SVD files"
pkgrel=1
pkgver=0.17.0
arch=('x86_64')
url="https://github.com/japaric/svd2rust"
license=('Apache' 'MIT')
makedepends=('rust' 'cargo')
source=("https://github.com/rust-embedded/svd2rust/archive/v${pkgver}.tar.gz")
md5sums=('9ddfd078fe5c2b430c038d79487f4c23')

build() {
	cd $srcdir/$pkgname-$pkgver
	cargo build --release
}

package() {
	cd $srcdir/$pkgname-$pkgver
	install -D -m755 "$srcdir/$pkgname-$pkgver/target/release/svd2rust" "$pkgdir/usr/bin/svd2rust"
}
