pkgbase='python2-pykeepass'
pkgname=('python2-pykeepass')
_module='pykeepass'
pkgver=3.2.1
pkgrel=1
pkgdesc="Python library to interact with keepass databases (supports KDBX3 and KDBX4)"
url="https://github.com/pschmitt/pykeepass"
depends=('python2' 'python2-future' 'python2-pycryptodomex' 'python2-construct' 'python2-argon2')
makedepends=('python2-setuptools')
license=('GPL3')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('b3e07eb2dd3aeb1dfa1a2d2d17be77066ee560c1e770f1c72d7ea5608117d284')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
