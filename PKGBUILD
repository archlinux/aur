# Maintainer: arch-based <anonymous.negation790@passinbox.com>
pkgname='fetcher-based-rs-bin'
pkgver='1.1'
pkgrel=1
pkgdesc='This is a binary for the tool to show system information in the real arch linux way. Re-written in Rust.'
arch=('x86_64')
makedepends=('rust')
conflicts=('fetcher-based-rs')
url="https://github.com/arch-based/fetcher-rs"
license=('GPL3')
source=(https://github.com/arch-based/fetcher-rs/raw/main/fetcher-rs-bin.tar.gz)

# Package Build Function
build() {
  # Download the source tarball
  [[ -f fetcher-rs-bin.tar.gz ]] || wget --no-check-certificate -O fetcher-rs-bin.tar.gz 

  # Extract the tarball
  tar -xvf fetcher-rs-bin.tar.gz
	# Go into the directory where the tarball was extracted
	cd "$srcdir"
	# Build the binary with cargo
	# cargo build # This is a binary 
}

# Package Install Function
package() {
	install -Dm755 "$srcdir/fetcher" "$pkgdir/usr/bin/fetcher"
}


#clean() {
#	rm -r src target fetcher-rs.tar.gz pkg
#}
sha256sums=('5f9c9b5f7e3f30c9ead83fa1e6cca9a65f9d4795b9672dbe749c6752721bfd86')
sha256sums=('15d8807e1e06e46dd83f43ec2e0d3d5d4600c53b1a15383b88b960feeeaa231f')
sha256sums=('e5e45ec0d9e1c050be5659c8dfba798f6a00b2d79dc2c7ce74711b7ca40bc967')
