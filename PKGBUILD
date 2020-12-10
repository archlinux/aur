# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-fontmake'
_pkgname='fontmake'
pkgver='2.3.0'
pkgrel=1
pkgdesc="Compile fonts from sources (UFO, Glyphs) to binary (OpenType, TrueType)"
url="https://github.com/googlefonts/fontmake"
checkdepends=('python-pytest')
depends=('python-cu2qu' 'python-defcon' 'python-fonttools>=4.18.1' 'python-fontmath' 'python-glyphslib' 'python-mutatormath' 'python-ufolib2' 'python-ufo2ft')
makedepends=('python-setuptools')
optdepends=()
license=('Apache')
arch=('any')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.zip")
sha256sums=('8e6c5ba20e124d56fe68a9fcfa94caf20f5335f287b481decf2bd66c855e4ced')

package() {
    cd "${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

check() {
    cd "$_pkgname-${pkgver}"
    PYTHONPATH=Lib pytest tests
}
