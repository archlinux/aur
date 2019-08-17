# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=('python-glyphslib')
_pkgname='glyphsLib'
pkgver='4.1.0'
pkgrel=1
pkgdesc="A bridge from Glyphs source files (.glyphs) to UFOs"
url="https://github.com/googlefonts/glyphsLib"
checkdepends=('python-pytest' 'python-ufonormalizer' 'python-unicodedata2=12.0.0' 'python-xmldiff')
depends=('python' 'python-defcon' 'python-fonttools')
makedepends=('python-setuptools')
optdepends=('python-ufonormalizer')
license=('Apache')
arch=('any')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.zip")
sha256sums=('0813bd8a61181bd481ac14c2a7aad536036d3a3eccaa4a6403e17cf9135f247e')

check() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py test
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}
