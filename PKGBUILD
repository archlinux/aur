# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgbase=python-nodeenv
pkgname=(python-nodeenv python2-nodeenv)
pkgver=1.3.3
pkgrel=1
pkgdesc="Node.js virtual environment builder"
url="https://ekalinin.github.io/nodeenv/"
license=("BSD")
arch=('any')
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/n/nodeenv/nodeenv-$pkgver.tar.gz")
sha256sums=('ad8259494cf1c9034539f6cced78a1da4840a4b157e23640bc4a0c0546b0cb7a')

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

