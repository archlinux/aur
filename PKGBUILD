# Maintainer: Veeti Paananen <veeti.paananen@rojekti.fi>

pkgname=manuale
pkgver=1.0.1
pkgrel=1
pkgdesc="A fully manual Let's Encrypt client"
arch=('any')
url="https://github.com/veeti/manuale"
license=('MIT')
depends=('python-setuptools' 'python-cryptography' 'python-requests')
source=("https://pypi.python.org/packages/source/m/manuale/manuale-${pkgver}.tar.gz")
sha256sums=('65301fada6d4afd765f64e2d9f609ae39bfd7997c23d8a21381dbf8ab7806fb4')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python3 setup.py install --root="$pkgdir/" --optimize=1

  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
