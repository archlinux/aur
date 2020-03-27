# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=python-glyphslib
_pkgname=glyphsLib
pkgver='5.1.7'
pkgrel=1
pkgdesc="A bridge from Glyphs source files (.glyphs) to UFOs"
url="https://github.com/googlefonts/glyphsLib"
checkdepends=('python>=3.8' 'python-pytest' 'python-ufonormalizer' 'python-xmldiff')
depends=('python' 'python-defcon' 'python-fonttools')
makedepends=('python-setuptools')
optdepends=('python-ufonormalizer')
license=('Apache')
arch=('any')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.zip")
sha256sums=('dfa2baf89c7418cea410b049ef95251a5256bc366ca62eef7271ee7ecf2ea602')

check() {
    cd "$srcdir/$_pkgname-$pkgver"
    PYTHONPATH=Lib pytest
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}
