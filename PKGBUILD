# Maintainer: Pierre Dommerc <dommerc.pierre@gmail.com>
# Contributor: lmartinez-mirror

pkgname=bato
pkgver=0.1.6
pkgrel=1
pkgdesc="Small program to send battery notifications"
arch=('x86_64')
url="https://github.com/doums/bato"
license=('MPL2')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
depends=('libnotify')
makedepends=('rust' 'cmake')
sha256sums=('71a9673ba797cc078a980e01b5b09af92ed4b3ce5a3d2b6be519e8e0c00189e7')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dvm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
}
