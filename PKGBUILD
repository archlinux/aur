pkgbase='python-bivalve'
pkgname=('python-bivalve')
_module='bivalve'
pkgver='0.21'
pkgrel=1
pkgdesc="A bi-directional shell-like socket protocol framework using asyncio",
url="https://github.com/lainproliant/bivalve"
depends=('python')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('e1bf914384309d809f9fea60c2d1a480d60c54deed6051c0ed3c2d8e8599d3ab')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}