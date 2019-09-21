pkgbase='python-tinydb'
pkgname=('python-tinydb')
_module='tinydb'
pkgver='3.14.1'
pkgrel=1
pkgdesc="TinyDB is a tiny, document oriented database optimized for your happiness :)"
url="https://github.com/msiemens/tinydb"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('c92ddb8155b85dfecc7661465127b79d6972e3f5df5b1f04ee089f4f84184ecf')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
