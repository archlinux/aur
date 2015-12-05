# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
_pkgname=affine
pkgname=python-${_pkgname}
pkgver=1.2.0
pkgrel=1
pkgdesc="Python package for generating multi-unit schematic symbols for KiCad from a CSV file"
url="https://github.com/xesscorp/KiPart"
depends=('python'
         'python-pip'
)
optdepends=()
license=('BSD')
arch=('any')
source=("https://pypi.python.org/packages/source/a/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('7671d9d5458b713d1f8bc3714983e17f1e981e97b7aaf9923fd1ceb8743861879c2b54cca17c36447ff00b3111f518ebe181f2e14fc296e95e66f38702499851')

build() {
    cd "$srcdir/${_pkgname}-$pkgver"
   python setup.py build
}

package() {
    cd "$srcdir/${_pkgname}-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
}

