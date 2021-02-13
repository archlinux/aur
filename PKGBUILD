# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=python-glyphslib
_pkgname=glyphsLib
pkgver=5.3.2
pkgrel=1
pkgdesc="A bridge from Glyphs source files (.glyphs) to UFOs"
url="https://github.com/googlefonts/glyphsLib"
checkdepends=('python>=3.8' 'python-pytest' 'python-ufolib2' 'python-ufonormalizer' 'python-xmldiff')
depends=('python-defcon' 'python-fonttools')
makedepends=('python-setuptools')
optdepends=('python-ufonormalizer')
license=('Apache')
arch=('any')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.zip")
sha256sums=('f0a4247c23c96c5d40a14970f651b402b8e23e517cf1a974bb8682e02d5cd3f9')

check() {
    cd "$srcdir/$_pkgname-$pkgver"
    PYTHONPATH=Lib pytest
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}
