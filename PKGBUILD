# Maintainer: Pierre Dommerc <dommerc.pierre@gmail.com>
# Contributor: lmartinez-mirror

pkgname=bato
pkgver=0.1.5
pkgrel=1
pkgdesc="Small program to send battery notifications"
arch=('x86_64')
url="https://github.com/doums/bato"
license=('MPL2')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
depends=('libnotify')
makedepends=('rust' 'cmake')
sha256sums=('ca0d7f6cbfc7ac736a40672bb526922788b7e0dfdfc3c283cd85d32edf0040ce')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dvm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
}
