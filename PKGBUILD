# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname='python-braceexpand'
_pkgname=${pkgname#python-}
pkgver=0.1.2
pkgrel=1
pkgdesc="Bash-style brace expansion"
arch=('any')
depends=()
makedepends=('python-setuptools')
url="https://github.com/KenKundert/$_pkgname"
license=('GPL3')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('13980ad19c80ed6097c245febb694e57baffd8179b50bc80437003eb01465ecb')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
