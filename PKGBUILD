# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-rlp
pkgver=0.3.8
pkgrel=1
pkgdesc="A package for encoding and decoding data in and from Recursive Length Prefix notation"
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
groups=('ethereum')
url="https://github.com/ethereum/pyrlp"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/r/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('89f23e2197bc70c82f48b81916947df5')
sha256sums=('347b1bfbe585fe56c9b9ca98d440fbaeaa005200d49cb4df06c62434306d2a77')

build() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg2 'Building...'
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg2 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
