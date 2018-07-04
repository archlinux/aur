# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
_pkgname=affine
pkgname=python-${_pkgname}
pkgver=2.2.1
pkgrel=1
pkgdesc="Python package for matrices describing affine transformation of the plane"
url="https://github.com/sgillies/affine"
depends=('python'
         'python-pip'
)
optdepends=()
license=('BSD')
arch=('any')
source=("https://pypi.python.org/packages/source/a/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('306e56e8e2cbe80e90400fe0469cfc09c583a9efc7796c3fa87bcb572ddb7548')

build() {
    cd "$srcdir/${_pkgname}-$pkgver"
   python setup.py build
}

package() {
    cd "$srcdir/${_pkgname}-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
}
