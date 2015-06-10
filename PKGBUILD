# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python2-clize
pkgver=2.4
pkgrel=2
pkgdesc="This decorator will turn your normal python functions into proper shell commands"
arch=('any')
url="https://pypi.python.org/pypi/clize/"
license=('MIT')
depends=('python2')
checkdepends=('python2-nose')
source=(http://pypi.python.org/packages/source/c/clize/clize-${pkgver}.tar.gz)
md5sums=('150f161299c95e314fba68a7b4ed49dc')


check() {
  cd "$srcdir/clize-$pkgver"
  ln -s "$srcdir/clize-$pkgver/clize.py" test
  python2 test/tests.py
}

package() {
  cd "$srcdir/clize-$pkgver"
  python2 setup.py install --root="${pkgdir}"
}

# vim:ts=2:sw=2:et:
