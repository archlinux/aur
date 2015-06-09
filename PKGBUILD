# Maintainer: kevinywlui gmail
pkgbase=python-qrcode
pkgname=(python-qrcode python-qrcode-bin)
pkgver=5.1
pkgrel=2
pkgdesc="QR Code image generator"
arch=('any')
url="https://pypi.python.org/pypi/qrcode"
license=('BSD')
depends=('python')
source=(https://pypi.python.org/packages/source/q/qrcode/qrcode-${pkgver}.tar.gz)
sha256sums=('33bdee5e834fc99eb538e1dad198a3a5b70d0a88845629cacf4c592be1ce7f6a')

package_python-qrcode() {
  depends+=('python-six' 'python-pillow')
  cd "$srcdir/qrcode-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  rm -rf "$pkgdir/usr/"{bin,share}/

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

package_python-qrcode-bin() {
  depends+=('python-setuptools' 'python-qrcode')
  conflicts=('python2-qrcode')
  cd "$srcdir/qrcode-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  rm -rf "$pkgdir/usr/lib/"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
