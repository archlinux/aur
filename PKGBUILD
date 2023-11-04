pkgbase='python-bivalve'
pkgname=('python-bivalve')
_module='bivalve'
pkgver='2.0.0'
pkgrel=1
pkgdesc="A bi-directional shell-like socket protocol framework using asyncio",
url="https://github.com/lainproliant/bivalve"
depends=('python')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('6ffba526f2f0054cd4f8622d893d54bb11c1e0f521717abf94d71295ce5adf96')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}