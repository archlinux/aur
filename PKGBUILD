pkgbase='python-inquirerpy'
pkgname=('python-inquirerpy')
_module='InquirerPy'
pkgver='0.3.4'
pkgrel=6
pkgdesc="Python port of Inquirer.js (A collection of common interactive command-line user interfaces)"
url="https://github.com/kazhala/InquirerPy"
depends=('python' 'python-pfzy' 'python-prompt_toolkit')
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('89d2ada0111f337483cb41ae31073108b2ec1e618a49d7110b0d7ade89fc197e')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation

}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/inquirerpy-${pkgver}-py3-none-any.whl
}
