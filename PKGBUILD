# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname='python-eth-keys'
_pkgname=${pkgname#python-}
pkgver=0.4.0
pkgrel=1
pkgdesc="A common API for Ethereum key operations with pluggable backends"
arch=('any')
depends=()
makedepends=('python-setuptools')
url="https://github.com/ethereum/$_pkgname"
license=('GPL3')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('7d18887483bc9b8a3fdd8e32ddcb30044b9f08fcb24a380d93b6eee3a5bb3216')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
