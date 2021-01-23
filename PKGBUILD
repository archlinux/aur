pkgname=python-titlecase
_module='titlecase'
pkgver=2.0.0
pkgrel=1
pkgdesc="Python Port of John Gruber's titlecase.pl"
url="https://github.com/ppannuto/python-titlecase"
depends=('python' 'python-regex')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/t/titlecase/titlecase-${pkgver}.tar.gz")
md5sums=('e5dac8b831203247997ba5db0f2f2dd6')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
