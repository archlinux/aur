# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-fontmake'
_pkgname='fontmake'
pkgver='2.3.1'
pkgrel=1
pkgdesc="Compile fonts from sources (UFO, Glyphs) to binary (OpenType, TrueType)"
url="https://github.com/googlefonts/fontmake"
checkdepends=('python-pytest')
depends=('python-cu2qu' 'python-defcon' 'python-fonttools>=4.18.1' 'python-fontmath' 'python-glyphslib' 'python-mutatormath' 'python-ufolib2' 'python-ufo2ft>=2.19.1')
makedepends=('python-setuptools')
optdepends=()
license=('Apache')
arch=('any')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.zip")
sha256sums=('02c34081f7e8a98f777d5f9e96b8c80270cc9d2b83ed558df4f5dcbc80dec8e8')

package() {
    cd "${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

check() {
    cd "$_pkgname-${pkgver}"
    PYTHONPATH=Lib pytest tests
}
