# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname='python-eth-account'
_pkgname=${pkgname#python-}
pkgver=0.6.1
pkgrel=1
pkgdesc="Sign Ethereum transactions and messages with local private keys"
arch=('any')
depends=('python-bitarray' 'python-eth-abi' 'python-eth-keyfile' 'python-eth-keys' 'python-eth-rlp' 'python-eth-utils' 'python-hexbytes' 'python-rlp')
makedepends=('python-setuptools')
url="https://github.com/ethereum/$_pkgname"
license=('GPL3')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('54b0b7d661e73f4cd12d508c9baa5c9a6e8c194aa7bafc39277cd673683ae50e')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
