pkgbase=('python-monkeytype')
pkgname=('python-monkeytype')
_module='MonkeyType'
pkgver='17.12.3'
pkgrel=1
pkgdesc="Generating type annotations from sampled production types"
url="https://github.com/instagram/MonkeyType"
depends=('python' 'python-retype' 'python-typed-ast')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/m/monkeytype/MonkeyType-${pkgver}.tar.gz")
sha256sums=('19d2061267c694ff6722ee28842f7b66c0dd1c0109b297167b750dc9e846a649')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
