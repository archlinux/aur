pkgbase='python-inquirerpy'
pkgname=('python-inquirerpy')
_module='InquirerPy'
pkgver='0.3.4'
pkgrel=1
pkgdesc="Python port of Inquirer.js (A collection of common interactive command-line user interfaces)"
url="https://github.com/kazhala/InquirerPy"
depends=('python' 'python-prompt_toolkit' 'python-pfzy')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('89d2ada0111f337483cb41ae31073108b2ec1e618a49d7110b0d7ade89fc197e')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
