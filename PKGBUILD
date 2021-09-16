# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname='python-eth-keys'
_pkgname=${pkgname#python-}
pkgver=0.3.3
pkgrel=1
pkgdesc="A common API for Ethereum key operations with pluggable backends"
arch=('any')
depends=()
makedepends=('python-setuptools')
url="https://github.com/ethereum/$_pkgname"
license=('GPL3')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('a9a1e83e443bd369265b1a1b66dc30f6841bdbb3577ecd042e037b7b405b6cb0')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
