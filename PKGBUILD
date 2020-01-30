# Maintainer: Christoph Brill <egore911@gmail.com>
pkgname=python-pytesseract
_pkgname=pytesseract
pkgver=0.3.2
pkgrel=2
pkgdesc="A Python wrapper for Google Tesseract"
arch=('any')
url="https://github.com/madmaze/pytesseract"
license=("Apache License 2.0")
depends=('python' 'tesseract' 'python-pillow')
makedepends=('python-setuptools')
conflicts=("${pkgname}" "${pkgname}-git")
#source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
source=("https://files.pythonhosted.org/packages/df/4e/42c54b4344cbcb392d949ffb0b1c1e95f03ceaa6a354c8d3aafcd470592e/$_pkgname-$pkgver.tar.gz")
sha256sums=('a8c3b74977e8fba6387f483f91f35e59e2ae7f34dfeff2028dc83adcd2afd0ac')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --skip-build --root="$pkgdir/" --optimize=1
}
