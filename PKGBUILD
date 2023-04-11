pkgbase='python2-pytesseract024'
pkgname=('python2-pytesseract024')
_module='pytesseract'
pkgver='0.2.4'
pkgrel=1
pkgdesc="Python-tesseract is a python wrapper for Google's Tesseract-OCR"
url="https://github.com/madmaze/python-tesseract"
depends=('python2')
makedepends=('python2-setuptools')
license=('unknown')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module/-/_}-$pkgver.tar.gz")
sha256sums=('9a9fae6331084f588c0cf2ad9ed50fca47e20429407e63389eb42d4e64460013')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
