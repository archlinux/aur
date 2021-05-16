# Maintainer: Pierre Dommerc <dommerc.pierre@gmail.com>
# Contributor: lmartinez-mirror

pkgname=bato
pkgver=0.1.3
pkgrel=1
pkgdesc="Small program to send battery notifications"
arch=('x86_64')
url="https://github.com/doums/bato"
license=('MPL2')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
depends=('libnotify')
makedepends=('rust' 'cmake')
sha256sums=('eff35fb2e51e41fb91cced7b9ca2c2a092bbd43fa102a157c8c148e538f25fd4')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dvm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
}
