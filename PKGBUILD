# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python-clize
pkgver=2.4
pkgrel=3
pkgdesc="This decorator will turn your normal python functions into proper shell commands"
arch=('any')
url="https://pypi.python.org/pypi/clize/"
license=('MIT')
depends=('python')
checkdepends=('python-nose')
source=(http://pypi.python.org/packages/source/c/clize/clize-${pkgver}.tar.gz)
md5sums=('150f161299c95e314fba68a7b4ed49dc')


check() {
  cd "$srcdir/clize-$pkgver"
  ln -s "$srcdir/clize-$pkgver/clize.py" test
  python test/tests.py
}

package() {
  cd "$srcdir/clize-$pkgver"
  python setup.py install --root="${pkgdir}"  --optimize=1
}

# vim:ts=2:sw=2:et:
