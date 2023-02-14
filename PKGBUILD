# Maintainer: Pedro Mendes <pedromendescraft@gmail.com>

pkgname=commits
_pkgname=commit
pkgver=0.5.0
pkgrel=1
pkgdesc="A tool to make patterned (conventional) commit messages"
arch=('x86_64' 'i686')
url="https://gitub.com/alt-art/commit"
license=('MIT')
depends=('git')
makedepends=('rust' 'cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/alt-art/$_pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('8685f0cd187980f980a7b6f26613bf32983e180eede1e0de09ef5e168b768328')

build() {
  cd "$_pkgname-$pkgver"
  cargo build --release
}

check() {
  cd "$_pkgname-$pkgver"
  cargo test
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$pkgname"
}
