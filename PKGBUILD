# Maintainer: Jaco Malan <jacom@codelog.co.za>
pkgbase=strain
pkgname=strain
pkgver=0.1.1
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
sha256sums=('a53c18049188d03fe3827a1888f3a3d44a71d79906a3dfdcfede1402dfbe4e38')

build() {
	cd "$srcdir/$pkgbase-$pkgver"
  CARGO_TARGET_DIR=./target cargo build --release
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	cp "$srcdir/$pkgbase-$pkgver/target/release/strain" "$pkgdir/usr/bin"
}
