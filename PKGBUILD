# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname='python-braceexpand'
_pkgname=${pkgname#python-}
pkgver=0.1.4
pkgrel=1
pkgdesc="Bash-style brace expansion"
arch=('any')
depends=()
makedepends=('python-setuptools')
url="https://github.com/trendels/$_pkgname"
license=('GPL3')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('d9b2eeb422e4efa8d3deb136d2f57257eeb59ec5705bafc696c7a7c8bff5c4e2')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
