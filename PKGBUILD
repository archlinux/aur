# Maintainer: Dimitri Merejkowsky <d.merej at gmail>
pkgname=rusync
pkgver="0.3.1"
pkgrel=1
pkgdesc="Ergonomic replacement for rsync"
url="http://github.com/dmerejkowsky/rusync"
arch=('x86_64')
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("rusync-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=('39771874253474272276aa3f816300ca')

build() {
  cd rusync-$pkgver
  cargo build --release
}

check() {
  cd rusync-$pkgver
  cargo test --release
}

package() {
  cd rusync-$pkgver
  install -Dm755 target/release/rusync "${pkgdir}/usr/bin/rusync"
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/rusync/LICENSE
}

# vim:set ts=2 sw=2 et:
