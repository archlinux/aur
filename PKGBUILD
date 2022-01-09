# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname='python-quantiphy'
_pkgname=${pkgname#python-}
pkgver=2.17.0
pkgrel=1
pkgdesc="Offers support for the pairing of a number and a unit of measure"
arch=('any')
depends=()
makedepends=('python-setuptools')
url="https://github.com/KenKundert/$_pkgname"
license=('GPL3')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('9660efae946ab5374c809cb8a771f6092602cc32f0d36c2726de153a0817ff42')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
