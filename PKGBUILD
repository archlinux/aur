pkgbase='python-monkeytype'
pkgname=('python-monkeytype')
_module='MonkeyType'
pkgver='20.5.0'
pkgrel=1
pkgdesc="Generating type annotations from sampled production types"
url="https://github.com/instagram/MonkeyType"
depends=('python' 'python-retype' 'python-typed-ast')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('fe596bebc5e1b6a64eae71a40b880688de433e4f70507a31ada48510195251dd')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
