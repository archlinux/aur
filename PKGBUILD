# Maintainer: Sebastien Leduc <sebastien@sleduc.fr>
pkgname=('python-redmine' 'python2-redmine')
pkgbase='python-redmine'
pkgver=2.0.2
pkgrel=1
pkgdesc="Python library for communicating with a Redmine project management application"
arch=("any")
url="http://python-redmine.readthedocs.org/"
license=('Apache')
makedepends=('python' 'python2')
options=(!emptydirs)
source=("https://pypi.python.org/packages/d6/6f/529c13202e2cd166c01f9984fc79ae1c28749782084b77ef5632f8385be3/${pkgbase}-${pkgver}.tar.gz")
md5sums=('14ec968d04ae427b449d8c5ab15d174e')

prepare() {
  cp -a "${srcdir}/${pkgbase}-${pkgver}"{,-python2}
}

package_python-redmine() {
  depends=('python' 'python-requests')
  cd "$srcdir/$pkgbase-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-redmine() {
  depends=('python2' 'python2-requests')
  cd "$srcdir/$pkgbase-$pkgver-python2"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
