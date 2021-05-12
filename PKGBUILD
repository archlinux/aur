# Contributor : dr460nf1r3 <dr460nf1r3 at garudalinux dot org>
# Mainintainer : Lucas Rooyakkers <lucas dot rooyakkers at queensu at ca>

pkgname=rmatrix-git
pkgver=3738314
pkgrel=1
pkgdesc="Rust port of a curses-based 'Matrix'-like screen"
arch=('any')
url="https://github.com/Fierthraix/rmatrix"
license=('GPL3')
provides=("rmatrix")
makedepends=('cargo' 'git') 
conflicts=('rmatrix')
source=("$pkgname::git+https://github.com/Fierthraix/rmatrix")
sha1sums=('SKIP')

build() {
  cd "$pkgname"
  cargo build --release
}

pkgver() {
  cd "$pkgname"
  echo r$(git describe --always | sed 's/-/./g')
}

package() {
  cd "$pkgname"
  install -Dm755 "target/release/r-matrix" "$pkgdir/usr/bin/rmatrix"
}
