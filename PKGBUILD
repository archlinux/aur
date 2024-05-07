# Maintainer: Jaco Malan <jacom@codelog.co.za>
pkgbase=strain
pkgname=strain
pkgver=0.0.3
pkgrel=1
pkgdesc="A CPU stressing utility written in Rust"
arch=('x86_64')
url="https://github.com/JacoMalan1/strain"
license=('MIT')
depends=(gcc-libs gmp lib32-gmp mpfr libmpc)
makedepends=('cargo' 'git' 'gcc')
provides=('strain')
conflicts=('strain')
source=("https://github.com/JacoMalan1/$pkgbase/archive/refs/tags/$pkgver.zip")
sha256sums=('7627cc9fdcde8805e3896ac8cd19d6aa15afd24d72cc6b4fc34b9d7a3f3819fc')

build() {
	cd "$srcdir/$pkgbase-$pkgver"
  CARGO_TARGET_DIR=./target cargo build --frozen --release
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	cp "$srcdir/$pkgbase-$pkgver/target/release/strain" "$pkgdir/usr/bin"
}
