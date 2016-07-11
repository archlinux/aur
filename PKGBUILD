# Maintainer: Sebastien Leduc <sebastien@sleduc.fr>
pkgname=('python-rebulk' 'python2-rebulk')
pkgbase='python-rebulk'
_pypi_name='rebulk'
pkgver=0.7.2
pkgrel=3
pkgdesc=" Define simple search patterns in bulk to perform advanced matching on any string. "
arch=("any")
url="https://github.com/Toilal/rebulk"
license=('MIT')
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/77/df/06b4d2ddc94d8618cd6da533e42c090cbf4aa90bd046a5b0224a53282e9d/${_pypi_name}-${pkgver}.tar.gz")
md5sums=('7501125afdaac727a54266fe5a5de018')

prepare() {
  cp -a "${srcdir}/${_pypi_name}-${pkgver}"{,-python2}
}

package_python-rebulk() {
  depends=('python-six' 'python-regex')
  cd "$srcdir/$_pypi_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-rebulk() {
  depends=('python2-six' 'python2-regex' 'python2-ordereddict')
  cd "$srcdir/$_pypi_name-$pkgver-python2"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
