# Maintainer: Alex Zose <alexander[dot]zosimidis[at]gmail[dot]com>

pkgname=('pyzbar')
pkgver=0.1.4
pkgrel=1
pkgdesc="A ctypes-based wrapper around the zbar barcode reader"
arch=('x86_64')
license=('MIT')
url="https://github.com/NaturalHistoryMuseum/pyzbar/"
depends=('zbar')
source=("$pkgname-$pkgver.tar.gz::https://github.com/NaturalHistoryMuseum/pyzbar/archive/v$pkgver.tar.gz")
sha512sums=('b36ba9bab67420f8f2b86c81eff57e1cf51516e76eae6759c7073264b43b5e88f4ee79b9f1cc4d6c67fcd8c4c3c648e8aea38884992685044d10615502fd1abb')

package() {
  mkdir -p $pkgdir/usr/lib/python3.6/site-packages/
  mkdir -p $pkgdir/usr/share/doc/$pkgname/
  mkdir -p $pkgdir/usr/share/licenses/$pkgname/

  cp -r $srcdir/$pkgname-$pkgver/$pkgname $pkgdir/usr/lib/python3.6/site-packages/
  install -m 644 $srcdir/$pkgname-$pkgver/{CHANGELOG,DEVELOPING,README}.md $pkgdir/usr/share/doc/$pkgname/
  install -m 644 $srcdir/$pkgname-$pkgver/LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
