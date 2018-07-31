pkgbase=('python-mupdf')
pkgname=('python-mupdf')
_module='PyMuPDF'
pkgver='1.13.15'
pkgrel=1
pkgdesc="Python bindings for the PDF rendering library MuPDF"
url="https://github.com/rk700/PyMuPDF"
depends=('python')
makedepends=('python-setuptools')
license=('AGPL')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/p/pymupdf/PyMuPDF-${pkgver}.tar.gz")
md5sums=('822bdf668992b11551b55ff3f5a72f0b')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
