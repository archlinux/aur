# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname='python-eth-rlp'
_pkgname=${pkgname#python-}
pkgver=0.3.0
pkgrel=1
pkgdesc="RLP definitions for common Ethereum objects in Python"
arch=('any')
depends=('python-rlp' 'python-eth-utils' 'python-hexbytes')
makedepends=('python-setuptools')
url="https://github.com/ethereum/$_pkgname"
license=('GPL3')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('f3263b548df718855d9a8dbd754473f383c0efc82914b0b849572ce3e06e71a6')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
