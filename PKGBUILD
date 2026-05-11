# Maintainer: Lucas Rooyakkers <lucas dot rooyakkers at queensu at ca>
pkgname=rmatrix
_cratename=r-matrix
pkgver=2.0.1
pkgrel=1
pkgdesc="Rust port of cmatrix."
arch=('x86_64')
url="https://github.com/Fierthraix/rmatrix"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
conflicts=('rmatrix-git')

package() {
  export CARGO_HOME="$srcdir/cargo-home"

  cargo install --locked --root "$pkgdir/usr" --version "$pkgver" "$_cratename"
  rm -f "$pkgdir/usr/.crates.toml" "$pkgdir/usr/.crates2.json"
  ln -s r-matrix "$pkgdir/usr/bin/rmatrix"
}

# vim:set ts=2 sw=2 et:
