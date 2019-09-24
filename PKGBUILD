pkgbase='python2-pykeepass'
pkgname=('python2-pykeepass')
_module='pykeepass'
pkgver='3.0.3'
pkgrel=1
pkgdesc="Python library to interact with keepass databases (supports KDBX3 and KDBX4)"
url="https://github.com/pschmitt/pykeepass"
depends=('python2' 'python2-construct' 'python2-argon2')
makedepends=('python2-setuptools')
license=('GPL3')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('2c9e2ddb03ee696ed8aa72c2cddfb81280614864e003226141d68b975aa56f6f')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
