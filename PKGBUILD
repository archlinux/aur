# Maintainer: Philipp Millar <philipp.millar@poxar.net>
# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=rusty-tags
pkgver=3.4.0
pkgrel=1
pkgdesc="Create ctags/etags for a cargo project and all of its dependencies"
url="https://github.com/dan-t/rusty-tags"
depends=('ctags')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('BSD')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dan-t/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('73131df981f9b33a16ef98608b069260e2eaca7d8c0b11443ab0b9dc3b241dd7')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
