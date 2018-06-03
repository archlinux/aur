# Maintainer: getzze <getzze at gmail dot com>

pkgname=('python-pymemoize' 'python2-pymemoize')
pkgver=1.0.2
pkgrel=1
pkgdesc="Simple Python cache and memoizing module"
arch=(any)
url="https://github.com/EliotBerriot/PyMemoize"
license=('BSD')
options=(!emptydirs)
source=("git+https://github.com/EliotBerriot/PyMemoize#branch=django")
sha256sums=('SKIP')
makedepends=('git' 'python-setuptools' 'python2-setuptools')

pkgver() {
  cd "PyMemoize"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package_python-pymemoize() {
  depends=('python')
  optdepends=('python-django' 'python-redis')
  cd "$srcdir/PyMemoize"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-pymemoize() {
  depends=('python2')
  optdepends=('python2-django' 'python2-redis')
  cd "$srcdir/PyMemoize"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
