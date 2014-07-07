# Maintainer: Lance Chen <cyen0312@gmail.com>
_pypiname=wheel
pkgbase=python-wheel
pkgname=('python-wheel' 'python2-wheel')
pkgver=0.24.0
pkgrel=1
pkgdesc="A built-package format for Python"
arch=(any)
url="https://pypi.python.org/pypi/wheel"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/w/wheel/$_pypiname-$pkgver.tar.gz")
md5sums=('3b0d66f0d127ea8befaa5d11453107fd')

package_python-wheel() {
  depends=('python')

  cd "$srcdir/$_pypiname-$pkgver"
  /usr/bin/python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-wheel() {
  depends=('python2')

  cd "$srcdir/$_pypiname-$pkgver"
  /usr/bin/python2 setup.py install --root="$pkgdir/" --optimize=1
  mv "$pkgdir/usr/bin/wheel" "$pkgdir/usr/bin/wheel2"
}

# vim:set ts=2 sw=2 et:
