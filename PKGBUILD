# Maintainer: Steven Guikal <aur-void@fluix.one>
pkgname=sline
pkgver=0.5.0
pkgrel=1
pkgdesc='Simple line-editing and command history library.'
arch=(x86_64)
url='https://sr.ht/~arivigo/sline/'
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~arivigo/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('f2c29261c7abd6de3763b38b17ca437e7c1fb937fc4cf760ffe83e5493692bd75c5095889dcb1bda4826d7232cbe25967574fe37ee617918cc014ef651753712')

build() {
  cd "$pkgname-$pkgver"
  make LDFLAGS="-Wl,-z,now"
}

package() {
  cd "$pkgname-$pkgver"
  make PREFIX=/usr MANPREFIX=/usr/share/man DESTDIR="$pkgdir/" install
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
