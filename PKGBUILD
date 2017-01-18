# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=rls
pkgver=alpha
pkgrel=1
pkgdesc="Rust Language Server"
url="https://github.com/jonathandturner/rls"
makedepends=('rust-nightly-bin')
arch=('i686' 'x86_64')
license=('Apache' 'MIT')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('7d04fac5b6218a8e98c380d74012d5c2daf0fe941385c4ae5d3d93a76d882b95')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
