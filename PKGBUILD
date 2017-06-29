pkgbase=python-nodeenv
pkgname=(python-nodeenv python2-nodeenv)
pkgver=1.1.4
pkgrel=0
pkgdesc="Node.js virtual environment builder"
url="https://github.com/ekalinin/nodeenv"
license=("BSD")
arch=('any')
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')
source=("https://pypi.python.org/packages/f9/7e/499dc78da542865f9f3d91e8b660883eb6a55fb40a10aa9407af0be66242/nodeenv-1.1.4.tar.gz")
sha256sums=('1c3f83a794dcb35df357104c1c87310e24f9a73d45a6518fd932c30f27a8f163')

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

