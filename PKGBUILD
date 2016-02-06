# Maintainer: Veeti Paananen <veeti.paananen@rojekti.fi>

pkgname=manuale
pkgver=1.0.0
pkgrel=1
pkgdesc="A fully manual Let's Encrypt client"
arch=('any')
url="https://github.com/veeti/manuale"
license=('MIT')
depends=('python-setuptools' 'python-cryptography' 'python-requests')
source=("https://pypi.python.org/packages/source/m/manuale/manuale-${pkgver}.tar.gz")
sha256sums=('aa4866bee634e9bd8aeafdfaeafea17e19a2efafe73ae2ec2d4a9d788d14b5bb')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python3 setup.py install --root="$pkgdir/" --optimize=1

  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
