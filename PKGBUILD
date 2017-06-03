# Maintainer: Sebastien Leduc <sebastien@sleduc.fr>
pkgname=('python-rebulk' 'python2-rebulk')
pkgbase='python-rebulk'
_guser='Toilal'
_gproject="rebulk"
pkgver=0.9.0
pkgrel=1
pkgdesc=" Define simple search patterns in bulk to perform advanced matching on any string. "
arch=("any")
url="https://github.com/Toilal/rebulk"
license=('MIT')
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools' 'python-pytest-runner' 'python2-pytest-runner')
options=(!emptydirs)
source=("https://github.com/${_guser}/${_gproject}/archive/${pkgver}.tar.gz")
md5sums=('7f76cd95e6ca9219202aeaa9b1b7b7c8')


prepare() {
  cp -a "${srcdir}/${_gproject}-${pkgver}"{,-python2}
}

package_python-rebulk() {
  depends=('python-six' 'python-regex')
  cd "$srcdir/$_gproject-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-rebulk() {
  depends=('python2-six' 'python2-regex' 'python2-ordereddict')
  cd "$srcdir/$_gproject-$pkgver-python2"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
