# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-base58
pkgver=0.2.2
pkgrel=1
pkgdesc="Bitcoin-compatible Base58 and Base58Check implementation"
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
url="https://pypi.python.org/pypi/base58"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/b/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('f4295cfee48304a9c0c3366c03699b97')
sha256sums=('f1eaa4d3b6a0a55b1304deadd3ce11effa5773e3b738f51813eccbf2f7ee5b80')
provides=('base58' 'python2-base58')
conflicts=('base58')

build() {
  cd $srcdir/${pkgname#python2-}-$pkgver

  msg 'Building...'
  python2 setup.py build
}

package() {
  cd $srcdir/${pkgname#python2-}-$pkgver

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
