# Developer: absrdspc <repom2@airmail.cc>
# Maintainer: absrdspc <repom2@airmail.cc>
# vim:et:ts=2:sw=2

pkgname=bishop
pkgver=1.0.0
pkgrel=1
pkgdesc="Command-line utility for visualizing data using The Drunken Bishop algorithm"
arch=('x86_64')
url="https://github.com/AbsurdlySuspicious/bishop.rs"
license=('MIT' 'Apache')
depends=()
makedepends=('rust' 'cargo')
conflicts=()

_src="bishop.rs-app_$pkgver"
_tar="$pkgname.tar.gz"

source=("$_tar"::"https://github.com/AbsurdlySuspicious/bishop.rs/archive/app_$pkgver.tar.gz")
sha256sums=('d9e42a162df51055e51893a75650e2da71b4aaaa201fa72cc1609983f61a3c45')


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

