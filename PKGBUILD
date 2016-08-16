# Maintainer: David Flemström <david.flemstrom@gmail.com>
pkgname=record-query-git
pkgver=master
pkgrel=1
epoch=
pkgdesc="A tool for doing record analysis and transformation"
arch=('i686' 'x86_64')
url=""
license=('Apache-2.0')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=($pkgname::git+https://github.com/dflemstr/rq.git)
noextract=()
md5sums=(SKIP)

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  cargo build --release
}

check() {
  cd "$srcdir/$pkgname"
  cargo test
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p "$pkgdir/usr/bin"
  install -m755 target/release/rq -t "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:
