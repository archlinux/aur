# Maintainer: FabricSoul <your-email@example.com>
pkgname=gitfetch
pkgver=0.1.1
pkgrel=1
pkgdesc="A command-line GitHub contribution visualization tool written in Rust inspired by Neofetch"
arch=('x86_64' 'aarch64')
url="https://github.com/FabricSoul/gitfetch"
license=('GPL3')
depends=()
makedepends=('rust' 'cargo' 'gcc' ''base-devel)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=("7931778c658de43fa4d85864f4fb7ee22a32000cbbf95fc2a73d6f60721622d5")
options=(!debug !lto)

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
