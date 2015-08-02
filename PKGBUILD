# Maintainer: Sebastien LEDUC <sebastien@sleduc.fr>
# Contributor: Andrey Mikhaylenko <neithere at gmail dot com>

pkgname=('python-pytest-cov' 'python2-pytest-cov')
_distname=pytest-cov
pkgver=2.0.0
pkgrel=1
pkgdesc='py.test plugin for coverage reporting with support for both centralised and distributed testing, including subprocesses and multiprocessing'
arch=('any')
license=('MIT')
url='https://github.com/schlamar/pytest-cov'
source=(http://pypi.python.org/packages/source/${_distname:0:1}/$_distname/$_distname-$pkgver.tar.gz)
md5sums=('c6520aefe1e9d15fde08348e32d738b9')

prepare() {
  cp -a "${srcdir}/${_distname}-${pkgver}"{,-python2}
}

package_python-pytest-cov() {
  depends=('python' 'python-py' 'python-pytest' 'python-cov-core')
  makedepends=("python-setuptools")

  cd "$srcdir/$_distname-$pkgver"
  python setup.py install --root="$pkgdir"/ --optimize=1
}

package_python2-pytest-cov() {
  depends=('python2' 'python2-py' 'python2-pytest' 'python2-cov-core')
  makedepends=("python2-setuptools")

  cd "$srcdir/$_distname-$pkgver-python2"
  python2 setup.py install --root="$pkgdir"/ --optimize=1
}
# vim:set ts=2 sw=2 et:
