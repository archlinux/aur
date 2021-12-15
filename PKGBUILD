# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Maintainer: Jelle van der Waa <jelle@archlinux.org>

pkgname=python2-funcsigs
pkgver=1.0.2
pkgrel=3
pkgdesc="Python function signatures from PEP362"
arch=('any')
url="https://pypi.python.org/pypi/funcsigs/"
license=('Apache')
depends=('python2')
makedepends=('python2-setuptools')
checkdepends=('python2-nose' 'python2-unittest2')
#source=(https://pypi.python.org/packages/source/f/funcsigs/funcsigs-${pkgver}.tar.gz)
source=(https://pypi.python.org/packages/94/4a/db842e7a0545de1cdb0439bb80e6e42dfe82aaeaadd4072f2263a4fbed23/funcsigs-1.0.2.tar.gz)
sha256sums=('a7bb0f2cf3a3fd1ab2732cb49eba4252c2af4240442415b4abce3b87022a8f50')

package() {
  cd "$srcdir/funcsigs-$pkgver"
  python2 setup.py install --root="${pkgdir}"  --optimize=1
}

check() {
  cd "$srcdir/funcsigs-$pkgver/tests"
  nosetests2 .
}

# vim:ts=2:sw=2:et:
