# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=('python-fontmake')
_pkgname='fontmake'
pkgver='2.0.4'
pkgrel=1
pkgdesc="Compile fonts from sources (UFO, Glyphs) to binary (OpenType, TrueType)."
url="https://github.com/googlefonts/fontmake"
checkdepends=('python-pytest')
depends=('python' 'python-cu2qu' 'python-defcon' 'python-fonttools' 'python-fontmath' 'python-glyphslib' 'python-mutatormath' 'python-ufolib2')
makedepends=('python-setuptools')
optdepends=()
license=('Apache')
arch=('any')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.zip")
sha256sums=('af3ada0505c10eca222de47906d7320b10eae8998617a929ee14643417342628')

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

check() {
    cd "$srcdir/$_pkgname-${pkgver}"
    PYTHONPATH=Lib pytest tests
}
