#Maintainer: Liam Timms <timms5000@gmail.com>

_pkgname=triangle
pkgname=python-$_pkgname
_name=${pkgname#python-}
pkgver=20200424
pkgrel=1
pkgdesc="Python bindings to the triangle library"
url="https://github.com/drufat/triangle"
arch=('any')
license=('GPL3')
depends=('triangle')
provides=("python-triangle")
options=(!emptydirs)
source=("https://github.com/drufat/${_pkgname}/archive/v${pkgver}.tar.gz")

sha256sums=('fe3e889aa27c0d9fb859881e70a1a1171b1a22e506b71899218052055416f616')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

