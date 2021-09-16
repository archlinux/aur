# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname='python-hexbytes'
_pkgname=${pkgname#python-}
pkgver=0.2.2
pkgrel=1
pkgdesc="Python bytes subclass that decodes hex, with a readable console output"
arch=('any')
depends=()
makedepends=('python-setuptools')
url="https://github.com/ethereum/$_pkgname"
license=('GPL3')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('a5881304d186e87578fb263a85317c808cf130e1d4b3d37d30142ab0f7898d03')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
