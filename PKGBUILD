pkgbase='python-inquirerpy'
pkgname=('python-inquirerpy')
_module='InquirerPy'
pkgver='0.3.1'
pkgrel=2
pkgdesc="Python port of Inquirer.js (A collection of common interactive command-line user interfaces)"
url="https://github.com/kazhala/InquirerPy"
depends=('python' 'python-prompt_toolkit')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('82995b728fa4cdac29bc6118d9da02e2f7f61f7b93ab430ca8ff40397ed8290b')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
