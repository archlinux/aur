# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname='python-eth-abi'
_pkgname=${pkgname#python-}
pkgver=1.2.1
pkgrel=1
pkgdesc="Python utilities for working with Ethereum ABI definitions, especially encoding and decoding."
arch=('any')
depends=('eth-utils' 'eth-typing' 'parsimonious')
makedepends=('python-setuptools')
url="https://github.com/ethereum/$_pkgname"
license=('GPL3')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('4afbe6890554531086682fa27bcdb9192bc80ef812569422eb7022e227a90e2b')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
