# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=rusty-tags
pkgver=2.2.0
pkgrel=1
pkgdesc="Create ctags/etags for a cargo project and all of its dependencies"
url="https://github.com/dan-t/rusty-tags"
depends=('ctags')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('BSD')
source=("https://github.com/dan-t/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('267596f2f4914cd18d04821fa078cba08f9b98c3914e99c24060e9f94cef83fa')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
