# Maintainer: Jaco Malan <jacom@codelog.co.za>
pkgbase=strain
pkgname=strain
pkgver=0.0.5
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
sha256sums=('64f5793e8096224ef8abd1de42864bb7d79190faa2c6e2a93a7580a0f9fcab6e')

build() {
	cd "$srcdir/$pkgbase-$pkgver"
  CARGO_TARGET_DIR=./target cargo build --frozen --release
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	cp "$srcdir/$pkgbase-$pkgver/target/release/strain" "$pkgdir/usr/bin"
}
