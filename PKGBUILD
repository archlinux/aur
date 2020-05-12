# Maintainer: Christoph Brill <egore911@gmail.com>
pkgname=python-pytesseract
_pkgname=pytesseract
pkgver=0.3.4
pkgrel=1
pkgdesc="A Python wrapper for Google Tesseract"
arch=('any')
url="https://github.com/madmaze/pytesseract"
license=("Apache License 2.0")
depends=('python' 'tesseract' 'python-pillow')
makedepends=('python-setuptools')
conflicts=("${pkgname}" "${pkgname}-git")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('afd8a5cdf8ab5d35690efbe71cbf5f89419f668ea8dde7649149815d5c5a899a')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --skip-build --root="$pkgdir/" --optimize=1
}
