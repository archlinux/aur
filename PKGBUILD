# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=rusty-tags
pkgver=2.5.1
pkgrel=1
pkgdesc="Create ctags/etags for a cargo project and all of its dependencies"
url="https://github.com/dan-t/rusty-tags"
depends=('ctags')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('BSD')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dan-t/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('3359252f8db276f53ff9a7ca6b50d583c9b279280707b2ea0e6c577b15aee7cc')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
