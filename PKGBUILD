# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=rls
pkgver=beta
pkgrel=1
pkgdesc="Rust Language Server"
url="https://github.com/rust-lang-nursery/rls"
makedepends=('rust-nightly')
arch=('i686' 'x86_64')
license=('Apache' 'MIT')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('5af4f082aa9e841ff94e8e23bb1851d3bbff663a6c1594a160358b0d755ec5cd')

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
