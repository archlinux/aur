# Mainintainer : Lucas Rooyakkers <lucas dot rooyakkers at queensu at ca>
pkgname=rmatrix
pkgver=1afcdd3
pkgrel=1
pkgdesc="Rust port of a curses-based 'Matrix'-like screen"
arch=('any')
url="https://github.com/Fierthraix/rmatrix"
license=('GPL3')
provides=("rmatrix")
makedepends=('git' 'cargo')
conflicts=('rmatrix')
source=("git+https://github.com/Fierthraix/rmatrix")
sha1sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  cargo build --release
}

pkgver() {
  cd "$srcdir/$pkgname"
  echo $(git describe --always | sed 's/-/./g')
}

package() {
  install -Dm755 "$srcdir/$pkgname/target/release/r-matrix" "$pkgdir/usr/bin/rmatrix"
}

# vim:set ts=2 sw=2 et:
