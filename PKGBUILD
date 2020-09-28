# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=python-glyphslib
_pkgname=glyphsLib
pkgver='5.2.0'
pkgrel=1
pkgdesc="A bridge from Glyphs source files (.glyphs) to UFOs"
url="https://github.com/googlefonts/glyphsLib"
checkdepends=('python>=3.8' 'python-pytest' 'python-ufolib2' 'python-ufonormalizer' 'python-xmldiff')
depends=('python' 'python-defcon' 'python-fonttools')
makedepends=('python-setuptools')
optdepends=('python-ufonormalizer')
license=('Apache')
arch=('any')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.zip")
sha256sums=('259b3b4d4455e0018ac36db679c2e7a51c3ee309c13dbd11f5161775b191380b')

check() {
    cd "$srcdir/$_pkgname-$pkgver"
    PYTHONPATH=Lib pytest
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}
