# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname='python-shlib'
_pkgname=${pkgname#python-}
pkgver=1.3.0
pkgrel=1
pkgdesc="Shell library"
arch=('any')
depends=('python-braceexpand' 'python-inform')
makedepends=('python-setuptools')
url="https://github.com/KenKundert/$_pkgname"
license=('GPL3')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('d14d69072a4ea63822170db6292002860ef35754eb2a88f989e75f24a82f7067')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
