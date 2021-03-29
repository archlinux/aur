# Maintainer: Pavle Portic <archlinux@theedgeofrage.com>

pkgbase='python-fdfgen'
pkgname=('python-fdfgen')
_module='fdfgen'
pkgver='0.16.1'
pkgrel=2
pkgdesc="Library for creating FDF files"
url="http://github.com/ccnmtl/fdfgen/"
depends=('python')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/f/fdfgen/fdfgen-${pkgver}.tar.gz")
sha256sums=('0eda63b5eb0810843dd98437778702fb396def51090ce8a01186e5234e247f8e')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
