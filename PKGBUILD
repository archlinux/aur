# Maintainer: Dylan Delgado <dylan1496 at live dot com>
# Contributor: Charles L <charliehogger31@gmail.com>

pkgbase='python-tinydb'
pkgname=('python-tinydb')
_module='tinydb'
pkgver='4.4.0'
pkgrel=1
pkgdesc="TinyDB is a tiny, document oriented database optimized for your happiness :)"
url="https://github.com/msiemens/tinydb"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('d57c29524ecacc081ebc24f96e0d787bba11dc20d52634a32a709b878be3545a')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
