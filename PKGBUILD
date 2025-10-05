# Maintainer: Gard Witch <irina.kdr@gmail.com>
pkgname=kadabra
pkgver=0.1.0
pkgrel=2
pkgdesc="A keyboard layout converter"
arch=('x86_64')
url="https://github.com/gard-witch/kadabra"
license=('GPL-3.0-or-later')
depends=('qt6-base')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gard-witch/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('f3e362b5888247a70372d37280279be209ce869cfa16051efd63d7f1e0e28708a67059eca47bd6e1539435643fe5583768bb421d7b5a0306382eafae8b00095e')
options=('!lto')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/kadabra" "$pkgdir/usr/bin/kadabra"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "data/io.github.Kadabra.desktop" "$pkgdir/usr/share/applications/io.github.Kadabra.desktop"
}
