# Maintainer: Pierre Dommerc <dommerc.pierre@gmail.com>

pkgname=bato
pkgver=0.1.7
pkgrel=1
pkgdesc='Small program to send battery notifications'
arch=('x86_64')
url='https://github.com/doums/bato'
license=('MPL2')
depends=('libnotify')
makedepends=('rust' 'cargo' 'cmake')
provides=('bato')
conflicts=('bato')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('913ec8446f03ad6492b624c2d2da1d5b0ddd7a1a620e3450cf8d3ca24ffc8983')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dvm 755 "target/release/bato" "$pkgdir/usr/bin/bato"
  install -Dvm 644 "bato.yaml" "$pkgdir/usr/share/doc/bato/config/bato.yaml"
}

