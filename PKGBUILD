# Maintainer: Pedro Mendes <me@altart.top>

pkgname=commits
_pkgname=commit
pkgver=0.6.0
pkgrel=1
pkgdesc="A tool to make patterned (conventional) commit messages"
arch=('x86_64' 'i686')
url="https://github.com/alt-art/commit"
license=('MIT')
depends=('git')
makedepends=('rust' 'cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/alt-art/$_pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('94dce18f7be7f6ad812d372735fd493ebf7eef79586141f2b649580380e3c3b8')

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
