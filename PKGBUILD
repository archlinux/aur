# Maintainer: Jaco Malan <jacom@codelog.co.za>
pkgbase=strain
pkgname=strain
pkgver=0.1.2
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
sha256sums=('55a05c9af28b2d846259bd9c05a55ed7ac9e238ad4ad0cb38bd15ba78500842a')

build() {
	cd "$srcdir/$pkgbase-$pkgver"
  CARGO_TARGET_DIR=./target cargo build --release
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	cp "$srcdir/$pkgbase-$pkgver/target/release/strain" "$pkgdir/usr/bin"
}
