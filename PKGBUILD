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
sha256sums=('72dcd74227f6f4e3bfad5a7359855a3c4235058ed38cf7d7e5f4f984311fc3bf')
