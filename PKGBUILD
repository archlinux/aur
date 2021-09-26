# Maintainer: Steven Guikal <aur-void@fluix.one>
pkgname=sline
pkgver=0.6.0
pkgrel=1
pkgdesc='Simple line-editing and command history library.'
arch=(x86_64)
url='https://sr.ht/~arivigo/sline/'
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~arivigo/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('2bdecb03a921484bb2cf47a4893a53d2b273a93ac7560c7d7e80fae0c36aea1338c8d75b415d0099e0eb13730793a394316da27d6b882c9439d1e86368dff2d1')

build() {
  cd "$pkgname-$pkgver"
  make LDFLAGS="-Wl,-z,now"
}

package() {
  cd "$pkgname-$pkgver"
  make PREFIX=/usr MANPREFIX=/usr/share/man DESTDIR="$pkgdir/" install
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
