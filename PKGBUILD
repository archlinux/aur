# Maintainer: Your name <bros at brocode dot sh>

pkgname=comtrya
pkgver=0.9.2
pkgrel=1
pkgdesc="A tool to help provision a fresh OS with the packages and configuration (dotfiles) you need to become productive again."
arch=('x86_64')
url="https://github.com/comtrya/comtrya"
options=(!lto)
license=('custom:MIT')
depends=()
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7bbd6ac04314e2dd541d8104908a2e8991a7489daab5563d01d28a3e48c08350')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --all-features
}

#check() {
#  cd "$pkgname-$pkgver"
#  cargo test --release
#}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
