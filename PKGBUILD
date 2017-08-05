# Maintainer: Sagittarius A* <lux.r.ck@gmail.com>
pkgname=rgssad
pkgver=0.1.0
pkgrel=1
pkgdesc="Extract rgssad/rgss2a/rgss3a files."
arch=('i686' 'x86_64')
url="https://github.com/luxrck/rgssad"
license=('MIT')
depends=()
makedepends=('cargo' 'rust' 'git')
source=("${pkgname}::git+https://github.com/luxrck/rgssad.git#tag=${pkgver}")
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname"

  mkdir -p "$pkgdir/usr/bin"
  mv "target/release/rgssad" "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:
