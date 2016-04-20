# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-ordereddict
pkgver=1.1
pkgrel=1
pkgdesc="A drop-in substitute for Py2.7's new collections.OrderedDict"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url="https://pypi.python.org/pypi/ordereddict"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/o/${pkgname#python-}/${pkgname#python-}-$pkgver.tar.gz)
md5sums=('a0ed854ee442051b249bfad0f638bbec')
sha256sums=('1c35b4ac206cef2d24816c89f89cf289dd3d38cf7c449bb3fab7bf6d43f01b1f')

build() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg2 'Building...'
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg2 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}
