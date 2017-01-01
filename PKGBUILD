# Maintainer: Veeti Paananen <veeti.paananen@rojekti.fi>

pkgname=manuale
pkgver=1.1.0
pkgrel=1
pkgdesc="A fully manual Let's Encrypt client"
arch=('any')
url="https://github.com/veeti/manuale"
license=('MIT')
depends=('python-setuptools' 'python-cryptography' 'python-requests')
source=("https://files.pythonhosted.org/packages/source/m/manuale/manuale-${pkgver}.tar.gz")
sha256sums=('5ead5682426538dfeac95ce84033d9096b9acf00f79598538e23ae06dfb2d7f0')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python3 setup.py install --root="$pkgdir/" --optimize=1

  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
