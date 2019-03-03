# Maintainer: redfish <redfish@galactica.pw>

pkgbase=python-pytest-ordering
pkgname=('python-pytest-ordering' 'python2-pytest-ordering')
_name=pytest-ordering
pkgver=0.6
pkgrel=1
pkgdesc='py.test plugin to run your tests in a specific order'
arch=('any')
license=('MIT')
url='https://github.com/ftobia/pytest-ordering'
makedepends=('python-setuptools' 'python2-setuptools'
             'python-pytest' 'python2-pytest')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('2529e5f96b1a62b28ea4ab30ebcbe6c93f193e547650c24e25840616f92a5f8b246b80216dec8762558bbd0b353619acec06809051845c62f9dacc0fbd4c720b')

prepare() {
  cp -a pytest-ordering-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/pytest-ordering-$pkgver
  python setup.py build

  cd "$srcdir"/pytest-ordering-$pkgver-py2
  python2 setup.py build
}

package_python-pytest-ordering() {
  depends=('python-pytest')

  cd pytest-ordering-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-pytest-ordering() {
  depends=('python2-pytest')

  cd pytest-ordering-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
}
# vim:set ts=2 sw=2 et:
