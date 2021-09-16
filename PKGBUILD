# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname='python-web3'
_pkgname=${pkgname#python-}
pkgver=5.23.1
pkgrel=2
pkgdesc="A Python library for interacting with Ethereum, inspired by web3.js"
arch=('any')
depends=('python-aiohttp' 'python-eth-abi' 'python-eth-account' 'python-eth' 'python-eth-typing' 'python-eth-utils' \
         'python-hexbytes' 'python-ipfshttpclient' 'python-jsonschema' 'python-lru-dict' 'python-protobuf' 'python-requests' \
         'python-websockets')

makedepends=('python-setuptools')
url="https://github.com/ethereum/$_pkgname"
license=('GPL3')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('e3bc899201c38859ae65b1905105628f70a0c1684a6fb76fa4dd5b1db4fc40b0')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
