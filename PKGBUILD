# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-cachetools
pkgver=2.0.1
pkgrel=1
pkgdesc="Extensible memoizing collections and decorators"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url="https://github.com/tkem/cachetools"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/54/e4/ddaa319bf53f04cda4ef99201de1c402871151b6edefe631bd426dc621a3/cachetools-2.0.1.tar.gz)
md5sums=('d9ffa584355aa9b69a664bf8a82c4890')
sha256sums=('ede01f2d3cbd6ddc9e35e16c2b0ce011d8bb70ce0dbaf282f5b4df24b213bc5d')

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
