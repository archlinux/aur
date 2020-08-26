# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname='python-inform'
_pkgname=${pkgname#python-}
pkgver=1.22.0
pkgrel=1
pkgdesc="Print and logging utilities for communicating with user"
arch=('any')
depends=('python-six' 'python-arrow')
makedepends=('python-setuptools')
url="https://github.com/KenKundert/$_pkgname"
license=('GPL3')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('ae361328709630d42b48d73eee530d419bd35a3bbf9b103142c184b46e43f4ba')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
