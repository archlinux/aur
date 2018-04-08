pkgbase=python-pylint-common
pkgname=python-pylint-common
_module='pylint-common'
pkgver=0.2.5
pkgrel=1
pkgdesc="pylint-common is a Pylint plugin to improve Pylint error analysis of the standard Python library"
url="https://github.com/landscapeio/pylint-common"
depends=('python')
makedepends=('python-setuptools')
license=('GPL')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/p/pylint-common/pylint-common-${pkgver}.tar.gz")
md5sums=('821725a39702815c68558df3059cb176')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
