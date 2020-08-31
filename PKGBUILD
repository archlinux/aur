# Developer: absrdspc <repom2@airmail.cc>
# Maintainer: absrdspc <repom2@airmail.cc>
# vim:et:ts=2:sw=2

pkgname=sg-sprite
pkgver=0.3.1
pkgrel=1
pkgdesc="Sprite/character (.lay files) decoder for MAGES. engine (Steins;Gate 0, Chaos;Child, Steins;Gate Steam Edition, etc)"
arch=('x86_64')
url="https://github.com/AbsurdlySuspicious/sg-sprite"
license=('Apache')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
conflicts=()

_src="$pkgname-$pkgver"
_tar="$pkgname_$pkgver.tar.gz"

source=("$_tar"::"https://github.com/AbsurdlySuspicious/sg-sprite/archive/$pkgver.tar.gz")
sha256sums=('db26a2a9464c73fad4bab412241ba43784e9ba4044c1ef287cccca5449d26543')

build() {
  cd "$srcdir/$_src"
  cargo build --all --release --locked
}

package() {
  install -Dm755 -t "$pkgdir/usr/bin" "$srcdir/$_src/target/release/$pkgname"
}


