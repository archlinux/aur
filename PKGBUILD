# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname='python-quantiphy'
_pkgname=${pkgname#python-}
pkgver=2.10.0
pkgrel=1
pkgdesc="Offers support for pairing of a number and a unit of measure"
arch=('any')
depends=()
makedepends=('python-setuptools')
url="https://github.com/KenKundert/$_pkgname"
license=('GPL3')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('0db4efac93cea8aff69fd77d6412b3291f0f095afb1389de671e738474223f6f')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
