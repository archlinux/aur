# Developer: absrdspc <repom2@airmail.cc>
# Maintainer: absrdspc <repom2@airmail.cc>
# vim:et:ts=2:sw=2

pkgname=bishop
pkgver=0.2.6
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
sha256sums=('bac65134405b1d77774f770600a6add564e6c8436287420577eaec2229c6f804')

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

