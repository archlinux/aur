pkgbase='python-bivalve'
pkgname=('python-bivalve')
_module='bivalve'
pkgver='0.22'
pkgrel=1
pkgdesc="A bi-directional shell-like socket protocol framework using asyncio",
url="https://github.com/lainproliant/bivalve"
depends=('python')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('a68a32b679ac6d1405d88ed4b1b0888ef1f39799594c167332fb1f04b004d9dd')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}