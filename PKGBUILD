# Maintainer: arch-based <anonymous.negation790@passinbox.com>
pkgname='fetcher-based-rs'
pkgver='0.1.2'
pkgrel=2
pkgdesc='This is a tool to show system information in the real arch linux way. Re-written in Rust.'
arch=('x86_64')
makedepends=(
  'cargo'
  'wget'
)
# provides=('fetcher-based-rs-bin')
conflicts=('fetcher-based-rs-bin')
url="https://github.com/arch-based/fetcher-rs"
license=('GPL-3.0')
source=(https://github.com/arch-based/fetcher-rs/raw/main/fetcher-rs.tar.gz)

# Package Build Function
build() {
  # Download the source tarball
  [[ -f fetcher-rs.tar.gz ]] || wget --no-check-certificate -O fetcher-rs.tar.gz 
 
   # Extract the tarball
  tar -xf fetcher-rs.tar.gz
  # Go into the directory where the tarball was extracted
  cd "$srcdir/src"
  # Build the binary with cargo
  cargo build
}

# Package Install Function
package() {
  install -Dm755 "$srcdir/target/debug/fetcher" "$pkgdir/usr/bin/fetcher"
}
sha256sums=(
  '11e75e9eb3b9d9f158ed3291ba3ce76ef2c6810b1fe52b857f59980087fa2432'
)
