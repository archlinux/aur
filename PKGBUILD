# Maintainer: arch-based <anonymous.negation790@passinbox.com>
pkgname='fetcher-based-rs'
pkgver='1.0'
pkgrel=1
pkgdesc='This is a tool to show system information in the real arch linux way. Re-written in Rust.'
arch=('x86_64')
makedepends=('rust')
conflicts=('fetcher-based-rs-bin')
url="https://github.com/arch-based/fetcher-rs"
license=('GPL3')
source=(https://github.com/arch-based/fetcher-rs/raw/main/fetcher-rs.tar.gz)

# Package Build Function
build() {
  # Download the source tarball
  [[ -f fetcher-rs.tar.gz ]] || wget --no-check-certificate -O fetcher-rs.tar.gz 

  # Extract the tarball
  tar -xvf fetcher-rs.tar.gz
	# Go into the directory where the tarball was extracted
	cd "$srcdir/src"
	# Build the binary with cargo
	cargo build
}

# Package Install Function
package() {
	install -Dm755 "$srcdir/target/debug/fetcher" "$pkgdir/usr/bin/fetcher"
}


#clean() {
#	rm -r src target fetcher-rs.tar.gz pkg
#}
sha256sums=('6d161c72101b3b862bad36542a5090ca6bfa38278b1dafd47ca30c5dbeccb8ae')
