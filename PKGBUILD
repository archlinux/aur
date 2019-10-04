# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname='python-braceexpand'
_pkgname=${pkgname#python-}
pkgver=0.1.3
pkgrel=1
pkgdesc="Bash-style brace expansion"
arch=('any')
depends=()
makedepends=('python-setuptools')
url="https://github.com/KenKundert/$_pkgname"
license=('GPL3')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('84f31e7211ff626c394ebf46854483e53a8c581557d38d390a6c63b967c30505')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
