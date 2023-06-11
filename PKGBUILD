# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname='python-hexbytes'
_pkgname=${pkgname#python-}
pkgver=0.3.1
pkgrel=1
pkgdesc="Python bytes subclass that decodes hex, with a readable console output"
arch=('any')
depends=()
makedepends=('python-setuptools')
url="https://github.com/ethereum/$_pkgname"
license=('GPL3')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('a3fe35c6831ee8fafd048c4c086b986075fc14fd46258fa24ecb8d65745f9a9d')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
