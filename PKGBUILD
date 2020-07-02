# Maintainer: Charles L <charliehogger31@gmail.com>

pkgbase='python-tinydb'
pkgname=('python-tinydb')
_module='tinydb'
pkgver='4.1.1'
pkgrel=1
pkgdesc="TinyDB is a tiny, document oriented database optimized for your happiness :)"
url="https://github.com/msiemens/tinydb"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('1b8d7308ba2fe6d582c6ae69f33c62013053939f7ab8d1787b1e15950566a202')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
