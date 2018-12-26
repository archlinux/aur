pkgbase=('python-dataset')
pkgname=('python-dataset')
_module='dataset'
pkgver='1.1.0'
pkgrel=1
pkgdesc="Toolkit for Python-based database access."
url="http://github.com/pudo/dataset"
depends=('python' 'python-sqlalchemy' 'python-alembic')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/d/dataset/dataset-${pkgver}.tar.gz")
md5sums=('SKIP')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
