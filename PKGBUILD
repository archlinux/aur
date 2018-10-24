pkgbase=('python-monkeytype')
pkgname=('python-monkeytype')
_module='MonkeyType'
pkgver='18.8.0'
pkgrel=1
pkgdesc="Generating type annotations from sampled production types"
url="https://github.com/instagram/MonkeyType"
depends=('python' 'python-retype' 'python-typed-ast')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/m/monkeytype/MonkeyType-${pkgver}.tar.gz")
sha256sums=('4ca20850a390d5ab2b4a51e9f8148352f9759e6f22e9e4db28c4fd6eb40e872e')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
