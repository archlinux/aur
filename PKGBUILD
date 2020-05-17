# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-fontmake'
_pkgname='fontmake'
pkgver='2.1.3'
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
sha256sums=('dd66c202dc1d1d5210ac027b02cd6340ae4704241b93fdeac308f7873fe671ee')

package() {
    cd "${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

check() {
    cd "$_pkgname-${pkgver}"
    PYTHONPATH=Lib pytest tests
}
