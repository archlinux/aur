# Maintainer: Dezzy <Justin@goredteam.net>

pkgbase=fubar
pkgname=('fubar-cli-git')
pkgver=09d86bc
pkgrel=1
pkgdesc="Formidable Unix Binary Arsenal & Repository"
arch=('x86_64')
url="https://github.com/irishmaestro/fubar"
license=('GPL3')
depends=()
makedepends=('cargo' 'git')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgbase"
  git rev-parse --short HEAD
}

build() {
  cd "$srcdir/$pkgbase"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgbase"
  install -Dm755 "target/release/fubar" "$pkgdir/usr/bin/fubar"
}


