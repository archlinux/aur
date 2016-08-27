# Maintainer: Veeti Paananen <veeti.paananen@rojekti.fi>

pkgname=manuale
pkgver=1.0.3
pkgrel=1
pkgdesc="A fully manual Let's Encrypt client"
arch=('any')
url="https://github.com/veeti/manuale"
license=('MIT')
depends=('python-setuptools' 'python-cryptography' 'python-requests')
source=("https://files.pythonhosted.org/packages/source/m/manuale/manuale-${pkgver}.tar.gz")
sha256sums=('3ee272b8e746bb0daa954d675d07c8cb803c80a04e3379ccf2d6adc664aa8fb0')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python3 setup.py install --root="$pkgdir/" --optimize=1

  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
