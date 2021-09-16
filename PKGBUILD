# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname='python-inform'
_pkgname=${pkgname#python-}
pkgver=1.26.0
pkgrel=1
pkgdesc="Print and logging utilities for communicating with user"
arch=('any')
depends=('python-six' 'python-arrow')
makedepends=('python-pip' 'python-setuptools')
url="https://github.com/KenKundert/$_pkgname"
license=('GPL3')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('7d5800b556f454a1b75c604d621abce0a3e1cdd43a9038e8e14f39a8211d7e82')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
