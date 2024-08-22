# Maintainer: Pierre Dommerc <dommerc.pierre@gmail.com>

pkgname=baru
pkgver=0.4.1
pkgrel=1
pkgdesc='A simple system monitor for WM statusbar'
arch=('x86_64')
url='https://github.com/doums/baru'
license=('MPL2')
depends=('libpulse')
makedepends=('rust' 'cargo')
provides=('baru')
conflicts=('baru')
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3b771e624ea89857761609b7ee58581f1f70efa574d181acc14671f05be63307')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dvm 755 "target/release/baru" "$pkgdir/usr/bin/baru"
  install -Dvm 644 "baru.yaml" "$pkgdir/usr/share/baru/baru.yaml"
}

