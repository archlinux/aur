pkgbase='python-pfzy'
pkgname=('python-pfzy')
_module='pfzy'
pkgver='0.3.4'
pkgrel=2
pkgdesc="Python port of the fzy fuzzy string matching algorithm"
url="https://github.com/kazhala/pfzy"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('717ea765dd10b63618e7298b2d98efd819e0b30cd5905c9707223dceeb94b3f1')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
