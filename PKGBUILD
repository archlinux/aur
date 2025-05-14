#Maintainer: Pierre Chevalier <pierrechevalier83@gmail.com>

pkgname=reclog
_pkgname=reclog
pkgver=0.1.3
pkgrel=1
pkgdesc="Command-line tool to capture command output to a file."
url="https://github.com/gavv/reclog"
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$_pkgname/$pkgver/download")
sha256sums=('496d3120f162b7226c85638a1686128cfb2afea861395d208eae627a56e3e7ba')

build() {
  cd "$_pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 target/release/reclog "$pkgdir/usr/bin/reclog"
   install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
