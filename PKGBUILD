# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname='python-eth-abi'
_pkgname=${pkgname#python-}
_fname=${pkgname/-/_}
pkgver=2.1.1
pkgrel=1
pkgdesc="Python utilities for working with Ethereum ABI definitions, especially encoding and decoding."
arch=('any')
depends=('python-eth-utils' 'python-eth-typing' 'python-parsimonious')
makedepends=('python-setuptools')
url="https://github.com/ethereum/$_pkgname"
license=('GPL3')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/${_pkgname/-/_}-$pkgver.tar.gz")
sha256sums=('4bb1d87bb6605823379b07f6c02c8af45df01a27cc85bd6abb7cf1446ce7d188')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
