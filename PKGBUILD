pkgbase=python-nodeenv
pkgname=(python-nodeenv python2-nodeenv)
pkgver=0.13.5
pkgrel=0
pkgdesc="Node.js virtual environment builder"
url="https://github.com/ekalinin/nodeenv"
license=("BSD")
arch=('any')
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')
source=("$pkgbase-$pkgver.tar.gz::https://pypi.python.org/packages/source/n/nodeenv/nodeenv-$pkgver.tar.gz")
md5sums=('3589277efa3fd90d6c58e2022de6af62')

package_python-nodeenv() {
  depends=('python')
  conflicts=('python2-nodeenv')

  cd $srcdir/nodeenv-${pkgver}
  python setup.py install --root=$pkgdir
  install -D -m0644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

package_python2-nodeenv() {
  depends=('python2')
  conflicts=('python-nodeenv')

  cd $srcdir/nodeenv-${pkgver}
  python2 setup.py install --root=$pkgdir
  install -D -m0644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

