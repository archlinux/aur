# Maintainer: Jonas DOREL <jonas at dorel dot me>

pkgbase='python-dodgy'
pkgname=('python-dodgy')
_module='dodgy'
pkgver='0.2.1'
pkgrel=1
pkgdesc="Searches for dodgy looking lines in Python code"
url="https://github.com/landscapeio/dodgy"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('28323cbfc9352139fdd3d316fa17f325cc0e9ac74438cbba51d70f9b48f86c3a')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
