pkgbase=python-nodeenv
pkgname=(python-nodeenv python2-nodeenv)
pkgver=1.2.0
pkgrel=1
pkgdesc="Node.js virtual environment builder"
url="https://github.com/ekalinin/nodeenv"
license=("BSD")
arch=('any')
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')
source=("https://pypi.python.org/packages/9f/0e/dd1c52f02a8ed7563da1984a5a6c740d3c752d4c6bcdb5f87dabf5c0d839/nodeenv-1.2.0.tar.gz")
sha256sums=('98835dab727f94a713eacc7234e3db6777a55cafb60f391485011899e5c818df')

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

