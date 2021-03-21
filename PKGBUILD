# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname='python-inform'
_pkgname=${pkgname#python-}
pkgver=1.23.0
pkgrel=2
pkgdesc="Print and logging utilities for communicating with user"
arch=('any')
depends=('python-six' 'python-arrow')
makedepends=('python-pip' 'python-setuptools')
url="https://github.com/KenKundert/$_pkgname"
license=('GPL3')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('bffd243e900d305035a6e7b3abfb91803c011eadb6907bf5ce3e2fbbe82c6c37')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
