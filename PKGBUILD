# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname='python-eth-abi'
_pkgname=${pkgname#python-}
_fname=${pkgname/-/_}
pkgver=3.0.0
pkgrel=1
pkgdesc="Python utilities for working with Ethereum ABI definitions, especially encoding and decoding."
arch=('any')
depends=('python-eth-utils' 'python-eth-typing' 'python-parsimonious')
makedepends=('python-setuptools')
url="https://github.com/ethereum/$_pkgname"
license=('GPL3')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/${_pkgname/-/_}-$pkgver.tar.gz")
sha256sums=('31578b179cf9430c21ac32a4e5f401c14b6e2cc1fd64ca3587cd354068217804')

build() {
  cd ${_pkgname/-/_}-$pkgver
  python setup.py build
}

package() {
  cd ${_pkgname/-/_}-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
