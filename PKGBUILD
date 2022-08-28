# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname='python-eth-abi'
_pkgname=${pkgname#python-}
_fname=${pkgname/-/_}
pkgver=3.0.1
pkgrel=1
pkgdesc="Python utilities for working with Ethereum ABI definitions, especially encoding and decoding."
arch=('any')
depends=('python-eth-utils' 'python-eth-typing' 'python-parsimonious')
makedepends=('python-setuptools')
url="https://github.com/ethereum/$_pkgname"
license=('GPL3')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/${_pkgname/-/_}-$pkgver.tar.gz")
sha256sums=('c3872e3ac1e9ef3f8c6599aaca4ee536d536eefca63a6892ab937f0560edb656')

build() {
  cd ${_pkgname/-/_}-$pkgver
  python setup.py build
}

package() {
  cd ${_pkgname/-/_}-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
