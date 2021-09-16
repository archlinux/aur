# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname='python-eth-rlp'
_pkgname=${pkgname#python-}
pkgver=0.2.1
pkgrel=1
pkgdesc="RLP definitions for common Ethereum objects in Python"
arch=('any')
depends=('python-rlp' 'python-eth-utils' 'python-hexbytes')
makedepends=('python-setuptools')
url="https://github.com/ethereum/$_pkgname"
license=('GPL3')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('f016f980b0ed42ee7650ba6e4e4d3c4e9aa06d8b9c6825a36d3afe5aa0187a8b')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
