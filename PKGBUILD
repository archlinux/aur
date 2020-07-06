# Maintainer: Felix Golatofski <contact@xdfr.de>

pkgbase='python-dataset'
pkgname=('python-dataset')
_module='dataset'
pkgver='1.3.2'
pkgrel=1
pkgdesc="Toolkit for Python-based database access."
url="http://github.com/pudo/dataset"
depends=('python')
makedepends=('python-setuptools' 'python-sqlalchemy' 'python-alembic')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('6be387eefcd5a98fe1a68b1403390648c71f2edc5cb271f0e1f1a44ca83409eb')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
