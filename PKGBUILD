# Developer: absrdspc <repom2@airmail.cc>
# Maintainer: absrdspc <repom2@airmail.cc>
# vim:et:ts=2:sw=2

pkgname=sg-sprite
pkgver=0.3.2
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
sha256sums=('431ffd0f80c4fb54d84f3237067339370026fdcec4257ab54478de248c9bf6c2')

build() {
  cd "$srcdir/$_src"
  cargo build --all --release --locked
}

package() {
  install -Dm755 -t "$pkgdir/usr/bin" "$srcdir/$_src/target/release/$pkgname"
}


