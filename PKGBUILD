# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-cachetools
pkgver=1.1.5
pkgrel=1
pkgdesc="Extensible memoizing collections and decorators"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url="https://github.com/tkem/cachetools"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/c/${pkgname#python-}/${pkgname#python-}-$pkgver.tar.gz)
md5sums=('7674e953ebe414f7ffc7696a4516f7fe')
sha256sums=('9810dd6afaec9e9eaae5ec33f2aa7117214a7a3f8427e70ab23939fe4d1bf279')

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
