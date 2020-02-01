# Initial commit: Alexey Andreyev aa13q at ya.ru

pkgbase='python-pymantic'
pkgname=('python-pymantic')
_module='pymantic'
pkgver='0.2.5'
pkgrel=1
pkgdesc="Semantic Web and RDF library for Python"
url="https://github.com/norcalrdf/pymantic/"
depends=('python' 'python-requests' 'python-lxml' 'python-pytz' 'python-rdflib' 'python-lark-parser' 'python-pyld' 'python-lepl')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('119361a60d811aea6f57faf05f9aebc787e37244e3c8e9c922e9621b2a425dcf')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
