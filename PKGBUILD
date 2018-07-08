# Maintainer: Sumner Evans <sumner.evans98 at gmail dot com>

pkgbase=('python-pdfkit')
pkgname=('python-pdfkit')
_module='pdfkit'
pkgver='0.6.1'
pkgrel=1
pkgdesc="Wkhtmltopdf python wrapper to convert html to pdf using the webkit rendering engine and qt"
url="https://github.com/JazzCore/python-pdfkit"
depends=('python' 'wkhtmltopdf')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/p/pdfkit/pdfkit-${pkgver}.tar.gz")
sha256sums=('ef1da35b78d534197e7ce4a604a4a190e9aa769e56634957535f3479a50d8cd1')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
