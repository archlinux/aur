pkgbase=('python-monkeytype')
pkgname=('python-monkeytype')
_module='MonkeyType'
pkgver='18.5.1'
pkgrel=1
pkgdesc="Generating type annotations from sampled production types"
url="https://github.com/instagram/MonkeyType"
depends=('python' 'python-retype' 'python-typed-ast')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/m/monkeytype/MonkeyType-${pkgver}.tar.gz")
sha256sums=('e170d1224eec57ffb0c66293eb55cab30e4acb116e5771c40b31ed0399878bcf')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
