# Contributor: kevinywlui gmail
# Maintainer: Steven Allen <steven@stebalien.com>
pkgbase=python-qrcode
pkgname=(python-qrcode python-qrcode-bin)
pkgver=5.3
pkgrel=1
pkgdesc="QR Code image generator"
arch=('any')
url="https://pypi.python.org/pypi/qrcode"
license=('BSD')
depends=('python>=3.5')
source=(https://pypi.python.org/packages/87/16/99038537dc58c87b136779c0e06d46887ff5104eb8c64989aac1ec8cba81/qrcode-${pkgver}.tar.gz{,.asc})
sha256sums=('4115ccee832620df16b659d4653568331015c718a754855caf5930805d76924e'
            'SKIP')
validpgpkeys=('012F5E34E68956C6C24A4D2FD6F44049700D3AF0')

package_python-qrcode() {
  depends+=('python-six' 'python-pillow')
  cd "$srcdir/qrcode-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  rm -rf "$pkgdir/usr/"{bin,share}/

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

package_python-qrcode-bin() {
  depends+=('python-setuptools' 'python-qrcode' 'python-colorama')
  conflicts=('python2-qrcode')
  cd "$srcdir/qrcode-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  rm -rf "$pkgdir/usr/lib/"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
