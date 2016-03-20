# Maintainer: Veeti Paananen <veeti.paananen@rojekti.fi>

pkgname=manuale
pkgver=1.0.2
pkgrel=1
pkgdesc="A fully manual Let's Encrypt client"
arch=('any')
url="https://github.com/veeti/manuale"
license=('MIT')
depends=('python-setuptools' 'python-cryptography' 'python-requests')
source=("https://pypi.python.org/packages/source/m/manuale/manuale-${pkgver}.tar.gz")
sha256sums=('778d37673a602305b9860b9218226c8dbccadc8366ae852c1fb6695b8cce48e7')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python3 setup.py install --root="$pkgdir/" --optimize=1

  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
