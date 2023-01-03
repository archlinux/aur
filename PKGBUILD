# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname='python-web3'
_pkgname=${pkgname#python-}
pkgver=5.31.3
pkgrel=1
pkgdesc="A Python library for interacting with Ethereum, inspired by web3.js"
arch=('any')
depends=('python-aiohttp' 'python-eth-abi' 'python-eth-account' 'python-eth-hash' 'python-eth-typing' 'python-eth-utils' \
         'python-hexbytes' 'python-ipfshttpclient' 'python-jsonschema' 'python-lru-dict' 'python-protobuf' 'python-requests' \
         'python-websockets')

makedepends=('python-setuptools')
url="https://github.com/ethereum/$_pkgname.py"
license=('GPL3')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('4b2d420647c81856e3cf398996cd3cc80c719dc3a10881884c5c3b1467e4f850')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
