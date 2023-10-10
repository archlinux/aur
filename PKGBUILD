pkgbase='python-bivalve'
pkgname=('python-bivalve')
_module='bivalve'
pkgver='0.15'
pkgrel=1
pkgdesc="A bi-directional shell-like socket protocol framework using asyncio",
url="https://github.com/lainproliant/bivalve"
depends=('python')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('762ec16196d552fe8638ce48b7dbe253f8fb38a9b97c0b62387c339ba649be81')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}