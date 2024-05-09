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
	install -Dm755 -t /usr/bin ../target/debug/fetcher
}


#clean() {
#	rm -r src target fetcher-rs.tar.gz pkg
#}
# sha256sums=('9559358cbfb570771e3da2768efdbb5aae9fdc4e590e3afce5a5e09a1e5a4b61')
sha256sums=('3d29976f1fd376792589f38749936006770d94474d36d910cbf007d0c1f2096e')

