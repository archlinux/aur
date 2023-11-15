# Maintainer: Pedro Mendes <me@altart.top>

pkgname=commits
_pkgname=commit
pkgver=0.7.0
pkgrel=1
pkgdesc="A tool to make patterned (conventional) commit messages"
arch=('x86_64' 'i686')
url="https://github.com/alt-art/commit"
license=('MIT')
depends=('git')
makedepends=('rust' 'cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/alt-art/$_pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('3bbe63b2fe57ef87b6ad4b3de6561461d4933a3ee8ec96a33875a06e26e79d4c')

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
