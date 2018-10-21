# Maintainer: getzze <getzze at gmail dot com>

pkgname=('python-pymemoize' 'python2-pymemoize')
pkgver=1.0.3
pkgrel=1
pkgdesc="Simple Python cache and memoizing module"
arch=(any)
url="https://github.com/mikeboers/PyMemoize"
license=('BSD')
options=(!emptydirs)
source=("https://github.com/mikeboers/PyMemoize/archive/v${pkgver}.tar.gz")
sha256sums=('21946d8cf60b80f71438256d8376b76375002ecfbb95d792588f22bea79cd0ee')
makedepends=('git' 'python-setuptools' 'python2-setuptools')


package_python-pymemoize() {
  depends=('python')
  optdepends=('python-django' 'python-redis')
  cd "$srcdir/PyMemoize"
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-pymemoize() {
  depends=('python2')
  optdepends=('python2-django' 'python2-redis')
  cd "$srcdir/PyMemoize"
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
