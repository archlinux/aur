# Maintainer: Felix Golatofski <contact@xdfr.de>

pkgbase='python-dataset'
pkgname=('python-dataset')
_module='dataset'
pkgver='1.3.1'
pkgrel=2
pkgdesc="Toolkit for Python-based database access."
url="http://github.com/pudo/dataset"
depends=('python')
makedepends=('python-setuptools' 'python-sqlalchemy' 'python-alembic')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('f656a3405ef5bd950fd0ee0ac484f8678d0560694a03d7c3a824de9a9f223a37')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
