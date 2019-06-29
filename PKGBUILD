pkgbase=('python-monkeytype')
pkgname=('python-monkeytype')
_module='MonkeyType'
pkgver='19.5.0'
pkgrel=1
pkgdesc="Generating type annotations from sampled production types"
url="https://github.com/instagram/MonkeyType"
depends=('python' 'python-retype' 'python-typed-ast')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/m/monkeytype/MonkeyType-${pkgver}.tar.gz")
sha256sums=('67c8a5694fbc78b3c763eccca834bcbc0a7964969fa467f78e43a4141d650787')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
