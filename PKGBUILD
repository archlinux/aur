# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=python-glyphslib
_pkgname=glyphsLib
pkgver='5.3.1'
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
sha256sums=('cbba9bb8379e1e76b6e163fe37abc957e3f7898c80630fc7b1f157274f7e7d08')

check() {
    cd "$srcdir/$_pkgname-$pkgver"
    PYTHONPATH=Lib pytest
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}
