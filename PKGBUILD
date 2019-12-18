#Maintainer: Liam Timms <timms5000@gmail.com>

_pkgname=triangle
pkgname=python-$_pkgname
_name=${pkgname#python-}
pkgver=20190115.3
pkgrel=1
pkgdesc="Python bindings to the triangle library"
url="https://github.com/drufat/triangle"
arch=('any')
license=('GPL3')
depends=('triangle')
provides=("python-triangle")
options=(!emptydirs)
source=("https://github.com/drufat/${_pkgname}/archive/v${pkgver}.tar.gz")

sha256sums=('bc116c440d237f4830d8f44681151c2cbf6bce74c6f4e12e3b431e4870b9e080')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

