# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-rlp
_name=rlp
pkgver=0.6.0
pkgrel=1
pkgdesc="A package for encoding and decoding data in and from Recursive Length Prefix notation"
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
groups=('ethereum')
url="https://github.com/ethereum/pyrlp"
license=('MIT')
options=(!emptydirs)
#source=(https://pypi.python.org/packages/source/r/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
source=(https://pypi.io/packages/source/r/${_name}/${_name}-${pkgver}.tar.gz)
md5sums=('433c15b0efa188752448a0dd422a5bc0')
sha256sums=('87879a0ba1479b760cee98af165de2eee95258b261faa293199f60742be96f34')

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
