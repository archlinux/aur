# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname='python-eth-account'
_pkgname=${pkgname#python-}
pkgver=0.8.0
pkgrel=1
pkgdesc="Sign Ethereum transactions and messages with local private keys"
arch=('any')
depends=('python-bitarray' 'python-eth-abi' 'python-eth-keyfile' 'python-eth-keys' 'python-eth-rlp' 'python-eth-utils' 'python-hexbytes' 'python-rlp')
makedepends=('python-setuptools')
url="https://github.com/ethereum/$_pkgname"
license=('GPL3')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('ccb2d90a16c81c8ea4ca4dc76a70b50f1d63cea6aff3c5a5eddedf9e45143eca')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
