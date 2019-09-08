# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname='python-inform'
_pkgname=${pkgname#python-}
pkgver=1.18.0
pkgrel=1
pkgdesc="Print and logging utilities for communicating with user"
arch=('any')
depends=('python-six' 'python-arrow')
makedepends=('python-setuptools')
url="https://github.com/KenKundert/$_pkgname"
license=('GPL3')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('660036f77523d9dea9f4c4556fb22728d6579a2266454ce16c829c88d64a454a')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
