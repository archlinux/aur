# Maintainer: Dylan Delgado <dylan1496 at live dot com>
# Contributor: Charles L <charliehogger31@gmail.com>

pkgbase='python-tinydb'
pkgname=('python-tinydb')
_module='tinydb'
pkgver='4.5.1'
pkgrel=1
pkgdesc="TinyDB is a tiny, document oriented database optimized for your happiness :)"
url="https://github.com/msiemens/tinydb"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('b780bceac6e37573b10fbcab6bcebb6b8bd5d8a0024533b5a452d9ef83465783')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
