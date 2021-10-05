# Maintainer: Steven Guikal <aur-void@fluix.one>
pkgname=sline
pkgver=0.6.2
pkgrel=1
pkgdesc='Simple line-editing and command history library.'
arch=(x86_64)
url='https://sr.ht/~arivigo/sline/'
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~arivigo/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('bd98dc04b4ff3084068763f62f676b79b1693edffc9415fa2f16345d7ba35e137a3eac5ffda7e841d3836880a22b702565df453218a9ea0f5eb6b8a96179bc31')

build() {
  cd "$pkgname-$pkgver"
  make LDFLAGS="-Wl,-z,now"
}

package() {
  cd "$pkgname-$pkgver"
  make PREFIX=/usr MANPREFIX=/usr/share/man DESTDIR="$pkgdir/" install
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
