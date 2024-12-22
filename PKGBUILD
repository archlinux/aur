# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=dijo-1995parham
pkgver=0.2.9
pkgrel=1
pkgdesc="Scriptable, curses-based, digital habit tracker"
arch=('x86_64')
url="https://github.com/1995parham/dijo"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('977e253795e1fbea5b4cc01741e95ccd6881c02a6302a28fbf9fe517480197ee')

build() {
  cd dijo-$pkgver
  cargo build --release --locked
}

package() {
  cd dijo-$pkgver
  install -Dm755 target/release/dijo -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/dijo"
}
