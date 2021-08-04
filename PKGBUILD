# Maintainer: Steven Guikal <aur-void@fluix.one>
pkgname=sline
pkgver=0.3.0
pkgrel=1
pkgdesc='Simple line-editing and command history library.'
arch=(x86_64)
url='https://sr.ht/~arivigo/sline/'
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~arivigo/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('75333c4ebd0ecc324c0075ec4432f845a1edfad791f1fed12aa5f7a142138a0b19129123e2cee5cc4feea773208bc76fb46068d4c449eced9f26a27996dd8c5e')

build() {
  cd "$pkgname-$pkgver"
  make LDFLAGS="-Wl,-z,now"
}

package() {
  cd "$pkgname-$pkgver"
  make PREFIX=/usr MANPREFIX=/usr/share/man DESTDIR="$pkgdir/" install
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
