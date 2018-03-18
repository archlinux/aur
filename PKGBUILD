# Maintainer: Alex Zose <alexander[dot]zosimidis[at]gmail[dot]com>

pkgname=('pyzbar')
pkgver=0.1.5
pkgrel=1
pkgdesc="A ctypes-based wrapper around the zbar barcode reader"
arch=('x86_64')
license=('MIT')
url="https://github.com/NaturalHistoryMuseum/pyzbar/"
depends=('zbar')
source=("$pkgname-$pkgver.tar.gz::https://github.com/NaturalHistoryMuseum/pyzbar/archive/v$pkgver.tar.gz")
sha512sums=('785c3e4cc5b44a1035004e4b4dd2ee538613aa021300b84c6183cc457c751fe4b4a419241608ef0e5e548d312596a0d5f4857a7b1388c6cef77fd021a0e0034a')

package() {
  mkdir -p $pkgdir/usr/share/doc/$pkgname/
  mkdir -p $pkgdir/usr/share/licenses/$pkgname/

  cd $srcdir/$pkgname-$pkgver
  python setup.py install --root=$pkgdir/ --no-compile
  install -m 644 $srcdir/$pkgname-$pkgver/{CHANGELOG,DEVELOPING,README}.md $pkgdir/usr/share/doc/$pkgname/
  install -m 644 $srcdir/$pkgname-$pkgver/LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:

