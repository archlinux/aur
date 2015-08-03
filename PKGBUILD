# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-base58
pkgver=0.2.2
pkgrel=1
pkgdesc="Bitcoin-compatible Base58 and Base58Check implementation"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url="https://pypi.python.org/pypi/base58"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/b/${pkgname#python-}/${pkgname#python-}-$pkgver.tar.gz)
md5sums=('f4295cfee48304a9c0c3366c03699b97')
sha256sums=('f1eaa4d3b6a0a55b1304deadd3ce11effa5773e3b738f51813eccbf2f7ee5b80')
provides=('base58' 'python-base58')
conflicts=('base58')

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
