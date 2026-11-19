# Maintainer: David Lishchyshen <microdaika1@gmail.com>
pkgname=wofi-power-menu
pkgver=0.3.7
pkgrel=1
pkgdesc="Highly configurable power menu using the wofi launcher power-menu"
arch=('x86_64')
url="https://github.com/szaffarano/wofi-power-menu"
license=('MIT')
depends=('wofi')
makedepends=('cargo')
source=("${pkgname}-${pkgver}::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2e9a0c73091dd3551bcd32f32dacdec2d1300d0f01d94f45ae6fb1746b1024e4')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "target/release/wofi-power-menu" "$pkgdir/usr/bin/wofi-power-menu"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

