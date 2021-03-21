# Maintainer: Sosthène Guédon <sosthene.gued@gmail.com>
# Contributor: Philipp Millar <philipp.millar@poxar.net>
# Contributor: Vlad M. <vlad@archlinux.net>

pkgname=rusty-tags
pkgver=3.9.0
pkgrel=2
pkgdesc="Create ctags/etags for a cargo project and all of its dependencies"
url="https://github.com/dan-t/rusty-tags"
depends=('ctags')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('BSD')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dan-t/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('5b06b36420f17d4779cd538c8916771e3fad3cd6ce7c16c59be7f73dc5ce5d2d')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}
 
package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
