# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname='python-shlib'
_pkgname=${pkgname#python-}
pkgver=1.2.0
pkgrel=1
pkgdesc="Shell library"
arch=('any')
depends=('python-braceexpand' 'python-inform')
makedepends=('python-setuptools')
url="https://github.com/KenKundert/$_pkgname"
license=('GPL3')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('359ab9426ffc4baa224906f43d642040d5fbac2ab3700e20ca2d57f799ae2231')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
