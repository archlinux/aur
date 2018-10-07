# Maintainer: Alex Zose <alexander[dot]zosimidis[at]gmail[dot]com>

pkgname=('pyzbar')
pkgver=0.1.7
pkgrel=1
pkgdesc="A ctypes-based wrapper around the zbar barcode reader"
arch=('any')
license=('MIT')
url="https://github.com/NaturalHistoryMuseum/$pkgname/"
depends=('zbar' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/NaturalHistoryMuseum/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('74b56658db7a8dc2d7a716992c001ec52a2befc9e31c41ecf7e5e1f277d4188963ef79a2433fc4befdd15d2f6e3f47c4f064582b530eef028c55e07e2c88dbbe')

package() {
  mkdir -p $pkgdir/usr/share/doc/$pkgname/
  mkdir -p $pkgdir/usr/share/licenses/$pkgname/

  cd $srcdir/$pkgname-$pkgver
  python setup.py install --root=$pkgdir/
  install -m 644 $srcdir/$pkgname-$pkgver/{CHANGELOG,DEVELOPING,README}.md $pkgdir/usr/share/doc/$pkgname/
  install -m 644 $srcdir/$pkgname-$pkgver/LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:

