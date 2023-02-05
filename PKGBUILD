# Maintainer: Dylan Delgado <dylan1496 at live dot com>
# Contributor: Charles L <charliehogger31@gmail.com>

pkgbase='python-tinydb'
pkgname=('python-tinydb')
_module='tinydb'
pkgver='4.7.1'
pkgrel=1
pkgdesc="TinyDB is a tiny, document oriented database optimized for your happiness :)"
url="https://github.com/msiemens/tinydb"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('8955c239a79b8a6c8f637900152e2de38690848199d71d870c33c16405433ca5')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
