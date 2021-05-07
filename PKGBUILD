# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname='python-braceexpand'
_pkgname=${pkgname#python-}
pkgver=0.1.7
pkgrel=1
pkgdesc="Bash-style brace expansion"
arch=('any')
depends=()
makedepends=('python-setuptools')
url="https://github.com/trendels/$_pkgname"
license=('GPL3')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('e6e539bd20eaea53547472ff94f4fb5c3d3bf9d0a89388c4b56663aba765f705')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
