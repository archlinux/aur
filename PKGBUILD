# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-fontmake'
_pkgname='fontmake'
pkgver='2.1.0'
pkgrel=1
pkgdesc="Compile fonts from sources (UFO, Glyphs) to binary (OpenType, TrueType)"
url="https://github.com/googlefonts/fontmake"
checkdepends=('python-pytest')
depends=('python' 'python-cu2qu' 'python-defcon' 'python-fonttools' 'python-fontmath' 'python-glyphslib' 'python-mutatormath' 'python-ufolib2' 'python-ufo2ft')
makedepends=('python-setuptools')
optdepends=()
license=('Apache')
arch=('any')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.zip")
sha256sums=('b31afc064b016c0d5fe16f768ed3b03118fac80672154ced29cf492707a06553')

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

check() {
    cd "$srcdir/$_pkgname-${pkgver}"
    PYTHONPATH=Lib pytest tests
}
