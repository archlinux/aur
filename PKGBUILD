# Maintainer: Jaco Malan <jacom@codelog.co.za>
pkgbase=strain
pkgname=strain
pkgver=0.0.4
pkgrel=1
pkgdesc="A CPU stressing utility written in Rust"
arch=('x86_64')
url="https://github.com/JacoMalan1/strain"
license=('GPL-3.0-or-later')
depends=(gcc-libs gmp lib32-gmp mpfr libmpc)
makedepends=('cargo' 'git' 'gcc')
provides=('strain')
conflicts=('strain')
source=("https://github.com/JacoMalan1/$pkgbase/archive/refs/tags/$pkgver.zip")
sha256sums=('1ca3acca9d85394039b013f43c99f0c4c3f9100f39d4f9a19bbac8598ad1a835')

build() {
	cd "$srcdir/$pkgbase-$pkgver"
  CARGO_TARGET_DIR=./target cargo build --frozen --release
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	cp "$srcdir/$pkgbase-$pkgver/target/release/strain" "$pkgdir/usr/bin"
}
