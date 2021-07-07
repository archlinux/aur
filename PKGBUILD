# Maintainer: Vedant K <gamemaker0042 at gmail dot com>

pkgname=hors
pkgver=0.8.2
pkgrel=1
pkgdesc='Instant coding answers via the command line (howdoi in rust)'
arch=('x86_64')
url='https://github.com/WindSoilder/hors'
license=('GPL3')
depends=('gcc-libs')
makedepends=('rust' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/WindSoilder/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('22419b26f64a2793759d3a3616df58196897cd9227074f475aeb3e1c366296a9')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked --all-features --target-dir=target
	strip target/release/hors
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/hors" "$pkgdir/usr/bin/hors"
}
