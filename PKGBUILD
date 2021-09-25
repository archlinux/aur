# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname='python-eth-account'
_pkgname=${pkgname#python-}
pkgver=0.5.6
pkgrel=1
pkgdesc="Sign Ethereum transactions and messages with local private keys"
arch=('any')
depends=('python-bitarray' 'python-eth-abi' 'python-eth-keyfile' 'python-eth-keys' 'python-eth-rlp' 'python-eth-utils' 'python-hexbytes' 'python-rlp')
makedepends=('python-setuptools')
url="https://github.com/ethereum/$_pkgname"
license=('GPL3')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('baef80956e88af5643f8602e72aab6bcd91d8a9f71dd03c7a7f1145f5e6fd694')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
