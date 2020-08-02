# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=python-glyphslib
_pkgname=glyphsLib
pkgver='5.1.11'
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
sha256sums=('3854ce2665fd210f5d0115dc49adb92804fe6c93f7d6055e118c130baec30038')

check() {
    cd "$srcdir/$_pkgname-$pkgver"
    PYTHONPATH=Lib pytest
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}
