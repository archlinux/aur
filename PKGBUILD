# Maintainer: Karol Babioch <karol@babioch.de>

pkgname=('python-pytzdata' 'python2-pytzdata')
pkgver=2017.2.2
pkgrel=1
pkgdesc="Official timezone database for Python."
arch=('any')
url="https://pypi.python.org/pypi/pytzdata"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools' )
options=('!emptydirs')
source=("git+https://github.com/sdispater/pytzdata#tag=$pkgver")
sha256sums=('SKIP')

package_python-pytzdata() {
  depends=('python')
  cd "$srcdir/pytzdata"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-pytzdata() {
  depends=('python2')
  cd "$srcdir/pytzdata"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

