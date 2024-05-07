# Maintainer: arch-based <anonymous.negation790@passinbox.com>
pkgname='fetcher-based'
pkgver='1.3'
pkgrel=1
pkgdesc='This is a tool to show system information in the real arch linux way. Re-written in C++.'
arch=('x86_64')
url="https://github.com/arch-based/fetcher-cpp"
license=('GPL3')
source=(https://github.com/arch-based/fetcher-cpp/raw/main/fetcher.tar.gz)

# Package Build Function
build() {
  # Download the binary tarball
  [[ -f fetcher.tar.gz ]] || wget --no-check-certificate -O fetcher.tar.gz 

  # Extract the binary to a temporary directory
  tar -xvf fetcher.tar.gz
}

# Package Install Function
package() {
  cd "$srcdir/"
  # Install the binary with proper permissions
  install -Dm 755 usr/bin/fetcher "$pkgdir/usr/bin/fetcher"
}
# sha256sums=('9559358cbfb570771e3da2768efdbb5aae9fdc4e590e3afce5a5e09a1e5a4b61')
sha256sums=('aecee5ed5f9752050ed84e4da77827b5e570cb3680075e9416ba6eb818863ad5')
