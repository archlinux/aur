# Maintainer: Sebastien LEDUC <sebastien@sleduc.fr>
# Contributor: Andrey Mikhaylenko <neithere at gmail dot com>

pkgname=('python-cov-core' 'python2-cov-core')
_distname=cov-core
pkgver=1.15.0
pkgrel=1
pkgdesc='plugin core for use by pytest-cov, nose-cov and nose2-cov'
arch=('any')
license=('MIT')
url='https://github.com/schlamar/cov-core'
source=("http://pypi.python.org/packages/source/c/$_distname/$_distname-$pkgver.tar.gz")
md5sums=('f519d4cb4c4e52856afb14af52919fe6')


prepare() {
  cp -a "${srcdir}/${_distname}-${pkgver}"{,-python2}
}

package_python-cov-core() {
  depends=('python' 'python-coverage')
  makedepends=("python-setuptools")

  cd "$srcdir/$_distname-$pkgver"
  python setup.py install --root="$pkgdir"/ --optimize=1
}

package_python2-cov-core() {
  depends=('python2' 'python2-coverage')
  makedepends=("python2-setuptools")

  cd "$srcdir/$_distname-$pkgver-python2"
  python2 setup.py install --root="$pkgdir"/ --optimize=1
}
# vim:set ts=2 sw=2 et:
