# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-rlp
pkgver=0.3.9
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
md5sums=('93bc5a27710794887ad044ec8cadba44')
sha256sums=('3283ee78bb60f24d2cb26be42c841a98feb0cace18a14a8eb405fa6a307420a6')

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
