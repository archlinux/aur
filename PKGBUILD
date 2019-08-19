# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=('python-glyphslib')
_pkgname='glyphsLib'
pkgver='4.1.1'
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
sha256sums=('e80810f6b98ca4e809278f9c010e1971698edae0ef8a83a965e075592ecfa4ee')

check() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py test
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}
