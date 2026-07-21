# Maintainer: Igor Giamoniano <benedictofamilia18@gmail.com>
# AUR: publique como "deriva" em https://aur.archlinux.org (veja PUBLISHING.md)
pkgname=deriva
pkgver=0.1.0
pkgrel=1
pkgdesc="Novel game de terminal — ficção interativa com ASCII art, cores e escolhas"
arch=('x86_64')
url="https://github.com/igorgbr/deriva"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('eae923627983cd2199d80eb0be8bbb4e870ab6d39714513a6b3e019f41dbae2e')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
