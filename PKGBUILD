# Maintainer: manhhieu <manhhieu>

pkgname='python-web3-new'
_pkgname=${pkgname#python-}  # Remove the 'python-' prefix
_pkgname=${_pkgname%-new}   # Remove the '-new' suffix
pkgver=6.11.3
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
sha256sums=('f9bec9d2339bf649fe25293435a5c897a4b035aa96d6c33670ed467acf59dbe7')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
