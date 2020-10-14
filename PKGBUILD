# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname='python-quantiphy'
_pkgname=${pkgname#python-}
pkgver=2.13.0
pkgrel=1
pkgdesc="Offers support for the pairing of a number and a unit of measure"
arch=('any')
depends=()
makedepends=('python-setuptools')
url="https://github.com/KenKundert/$_pkgname"
license=('GPL3')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('c1ff3a03545aa98a765897ca18836590633b9b551eace77e0171d4e5e95d0f8f')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
