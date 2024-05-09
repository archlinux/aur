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
	install -Dm755 ../target/debug/fetcher /usr/bin/fetcher
}


#clean() {
#	rm -r src target fetcher-rs.tar.gz pkg
#}
sha256sums=('5f9c9b5f7e3f30c9ead83fa1e6cca9a65f9d4795b9672dbe749c6752721bfd86')
