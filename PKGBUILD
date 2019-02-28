# Maintainer: Alex Zose <alexander[dot]zosimidis[at]gmail[dot]com>

pkgname=('pyzbar')
pkgver=0.1.8
pkgrel=1
pkgdesc="A ctypes-based wrapper around the zbar barcode reader"
arch=('any')
license=('MIT')
url="https://github.com/NaturalHistoryMuseum/$pkgname/"
depends=('zbar' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/NaturalHistoryMuseum/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('e186c7a2f29ec107f66b87a2901e128291747ef7a2159675f3170aef2a3a4b1f4cb4319da830d577c986e20abb3f2935e005361cc98857b0e1b880fb4cf40233')

package() {
  mkdir -p $pkgdir/usr/share/doc/$pkgname/
  mkdir -p $pkgdir/usr/share/licenses/$pkgname/

  cd $srcdir/$pkgname-$pkgver
  python setup.py install --root=$pkgdir/
  install -m 644 $srcdir/$pkgname-$pkgver/{CHANGELOG,DEVELOPING}.md $pkgdir/usr/share/doc/$pkgname/
  install -m 644 $srcdir/$pkgname-$pkgver/README.rst $pkgdir/usr/share/doc/$pkgname/
  install -m 644 $srcdir/$pkgname-$pkgver/LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/
}
