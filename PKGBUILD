# Maintainer: Pierre Dommerc <dommerc.pierre@gmail.com>

pkgname=baru
pkgver=0.2.9
pkgrel=1
pkgdesc='A system monitor written in Rust and C'
arch=('x86_64')
url='https://github.com/doums/baru'
license=('MPL2')
depends=('libpulse')
makedepends=('rust' 'cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3a7b920e6d33b68d84fc083dabf34dc4c7201430e5701e21f83ea4844821498b')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dvm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dvm 644 baru.yaml -t "$pkgdir/usr/share/$pkgname/"
}

