# Developer: absrdspc <repom2@airmail.cc>
# Maintainer: absrdspc <repom2@airmail.cc>
# vim:et:ts=2:sw=2

pkgname=bishop
pkgver=0.2.0
pkgrel=2
pkgdesc="Command-line utility for visualizing data using The Drunken Bishop algorithm"
arch=('x86_64')
url="https://github.com/AbsurdlySuspicious/bishop.rs"
license=('MIT' 'Apache')
depends=()
makedepends=('rust' 'cargo')
conflicts=()

_src="bishop.rs-app_$pkgver"
_tar="$pkgname.tar.gz"

source=("$_tar"::"https://github.com/AbsurdlySuspicious/bishop.rs/archive/app_0.2.0.tar.gz")
sha256sums=('1e04aa21572bbce8f71c38fca8eba56dc49645dd2072012997f1f005307276bf')

check() {
  cd "$srcdir/$_src"
  cargo test --all --release --locked
}

build() {
  cd "$srcdir/$_src"
  cargo build --all --release --locked
}

package() {
  install -Dm755 -t "$pkgdir/usr/bin" "$srcdir/$_src/target/release/$pkgname"
}

