# Maintainer: Steven Guikal <aur-void@fluix.one>
pkgname=sline
pkgver=0.2.0
pkgrel=1
pkgdesc='Simple line-editing and command history library.'
arch=(x86_64)
url='https://sr.ht/~arivigo/sline/'
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~arivigo/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('5c5f1a00f43ef46adf33c8d862b1fe6f44a3a4c1a33a3b8028fb9ca07df42d2d64929554322cff42b05047288efce74879bb02a31d970ccab5aaa0d96ce00cab')

build() {
  cd "$pkgname-$pkgver"
  make LDFLAGS="-Wl,-z,now"
}

package() {
  cd "$pkgname-$pkgver"
  make PREFIX=/usr MANPREFIX=/usr/share/man DESTDIR="$pkgdir/" install
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
