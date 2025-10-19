# Maintainer: iamawacko <iamawacko@protonmail.com>
# Contributor: Jiuyang Liu <liujiuyang1994@gmail.com>

pkgname=svd2rust
pkgdesc="Generate Rust register maps (\`struct\`s) from SVD files"
pkgrel=1
pkgver=0.37.1
arch=('any')
url="https://github.com/japaric/svd2rust"
license=('Apache' 'MIT')
makedepends=('rust' 'cargo')
source=("https://github.com/rust-embedded/svd2rust/archive/v${pkgver}.tar.gz")
md5sums=('b60735f8d86ea07ece1e03041464acfc')

build() {
	cd $srcdir/$pkgname-$pkgver
	cargo build --release
}

package() {
	cd $srcdir/$pkgname-$pkgver
	install -D -m755 "$srcdir/$pkgname-$pkgver/target/release/svd2rust" "$pkgdir/usr/bin/svd2rust"
}
