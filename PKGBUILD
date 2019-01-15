pkgbase=('python-mupdf')
pkgname=('python-mupdf')
_module='PyMuPDF'
pkgver='1.14.6'
pkgrel=1
pkgdesc="Python bindings for the PDF rendering library MuPDF"
url="https://github.com/rk700/PyMuPDF"
depends=('python')
makedepends=('python-setuptools')
license=('AGPL')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/p/pymupdf/PyMuPDF-${pkgver}.tar.gz")
md5sums=('1ab8db8668bf9efbaa3f1dfefdea717d')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
