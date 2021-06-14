# Maintainer: yunmikun2 <yunmikun2@protonmail.com>
# Contributor: mfgm2 <repom2@airmail.cc>
pkgname=mnesec
pkgver=1.0.0
pkgrel=2
pkgdesc="Generates mnemonic sequences from random bytes from stdin"
url="https://github.com/yunmikun2/mnesec"
arch=('i686' 'x86_64')
license=('Apache License Version 2.0')
depends=()
makedepends=('rust' 'cargo' 'git')
install=
source=("git+$url")
sha256sums=('SKIP')
provides=("mnesec")

build() {
  cd $srcdir/mnesec
  cargo build --release --locked
}

package() {
  cd $srcdir/mnesec
  install -D -m755 ./target/release/mnesec "$pkgdir/usr/bin/mnesec"
}
