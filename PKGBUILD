# Maintainer: ImVILLS <ваш@email.com>
pkgname=neocash
pkgver=1.1.0
pkgrel=1
pkgdesc="Modern shell with advanced features"
arch=('x86_64')
url="https://github.com/ImVILLS/neocash"
license=('MIT')
depends=('rust' 'git')
makedepends=('cargo')
install=neocash.install
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/neocash" "$pkgdir/usr/bin/neocash"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
