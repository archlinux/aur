# Maintainer: Sosthène Guédon <sosthene.gued@gmail.com>
# Contributor: Philipp Millar <philipp.millar@poxar.net>
# Contributor: Vlad M. <vlad@archlinux.net>

pkgname=rusty-tags
pkgver=3.5.1
pkgrel=1
pkgdesc="Create ctags/etags for a cargo project and all of its dependencies"
url="https://github.com/dan-t/rusty-tags"
depends=('ctags')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('BSD')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dan-t/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('d5c2c875b1c88e72e4d54689323178e0')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
