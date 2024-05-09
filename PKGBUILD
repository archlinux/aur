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
  [[ -f fetcher.tar.gz ]] || wget --no-check-certificate -O fetcher-rs.tar.gz 

  # Extract the tarball
  tar -xvf fetcher-rs.tar.gz
	# Go into the directory where the tarball was extracted
	cd "$srcdir/src"
	# Build the binary with cargo
	cargo build
}

# Package Install Function
package() {
	install -dm755 ../target/debug/fetcher /usr/bin/fetcher
}

### Very Scary ### so no hehe
#clean() {
#	rm -r src target
#}
# sha256sums=('9559358cbfb570771e3da2768efdbb5aae9fdc4e590e3afce5a5e09a1e5a4b61')
sha256sums=('aecee5ed5f9752050ed84e4da77827b5e570cb3680075e9416ba6eb818863ad5')
