pkgname=ruplacer
pkgver="0.2.3"
pkgrel=1
pkgdesc="Find and replace text in source files"
url="http://github.com/supertanker/ruplacer"
arch=('x86_64')
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("ruplacer-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=('9aa102e0cc4acc16aec6e97dccd5b9bd')

build() {
  cd ruplacer-$pkgver
  cargo build --release
}

check() {
  cd ruplacer-$pkgver
  cargo test --release
}

package() {
  cd ruplacer-$pkgver
  install -Dm755 target/release/ruplacer "${pkgdir}/usr/bin/ruplacer"
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/ruplacer/LICENSE
}

# vim:set ts=2 sw=2 et:
