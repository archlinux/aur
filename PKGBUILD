# Maintainer: Your name <bros at brocode dot sh>

pkgname=comtrya
pkgver=0.8.6
pkgrel=1
pkgdesc="A tool to help provision a fresh OS with the packages and configuration (dotfiles) you need to become productive again."
arch=('x86_64')
url="https://github.com/comtrya/comtrya"
license=('custom:MIT')
depends=()
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('75fb99b528a0ccc132d1c6ef29c2719aad75148223658cf13d980f8c80709682')

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
