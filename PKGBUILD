# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=rls
pkgver=alpha2
_pkgver=alpha-2
pkgrel=1
pkgdesc="Rust Language Server"
url="https://github.com/rust-lang-nursery/rls"
makedepends=('rust-nightly-bin')
arch=('i686' 'x86_64')
license=('Apache' 'MIT')
source=("$url/archive/$_pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('ceec4b8b6672732512db45436adb69ebe43f261c73bfef82c494b5d3cf0df6ea')

build() {
  cd "$pkgname-$_pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$_pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
