# Maintainer: Pierre Dommerc <dommerc.pierre@gmail.com>
# Contributor: lmartinez-mirror

pkgname=bato
pkgver=0.1.4
pkgrel=1
pkgdesc="Small program to send battery notifications"
arch=('x86_64')
url="https://github.com/doums/bato"
license=('MPL2')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
depends=('libnotify')
makedepends=('rust' 'cmake')
sha256sums=('b926ab13fae370b53b76c0be08aa33277e637fda6cc159b7f26a75f898e2257e')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dvm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
}
