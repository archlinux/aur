# Maintainer: Matthew Hague <matthewhague zoho com>
# Contributor: Matthew Hague <matthewhague zoho com>

pkgbase=python-toposort
pkgname=('python-toposort' 'python2-toposort')
pkgver=1.4
pkgrel=1
license=('Apache')
arch=('any')
url="http://pypi.python.org/pypi/toposort"
makedepends=('python2' 'python')
source=("http://pypi.python.org/packages/source/t/toposort/toposort-${pkgver}.tar.gz")
md5sums=('02433c00de9eaecf494245c4bca5e922')

prepare() {
  cp -a toposort-${pkgver} python2-toposort-${pkgver}
}

package_python-toposort() {
  pkgdesc="A Python3 library for topological sort"
  depends=('python')

  cd toposort-${pkgver}
  python setup.py install --root="${pkgdir}/" --optimize=1
}

package_python2-toposort() {
  pkgdesc="A Python2 library for topological sort"
  depends=('python2')

  cd python2-toposort-${pkgver}

  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
