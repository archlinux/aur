pkgbase='python-bivalve'
pkgname=('python-bivalve')
_module='bivalve'
pkgver='0.20'
pkgrel=1
pkgdesc="A bi-directional shell-like socket protocol framework using asyncio",
url="https://github.com/lainproliant/bivalve"
depends=('python')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('dfcee9b7f01b323d9529bad5a2e495c1566c337faf9da3bbbb4f02b25c4f61e4')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}