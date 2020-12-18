# Maintainer: Bet4 <bet4it@gmail.com>

_pkgname=Whirlpool
pkgname=python-whirlpool
pkgver=1.0.0
pkgrel=1
pkgdesc="Python wrapper extension for C Whirlpool digest reference implementation"
arch=('x86_64')
url="https://github.com/oohlaf/python-whirlpool"
license=('Unlicense')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('b8e60a8f5a0e09ad0c4015c2f7911d34afedd9dc18528a3c6197475e94b96f54')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
