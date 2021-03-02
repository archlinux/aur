pkgbase='python2-pykeepass'
pkgname=('python2-pykeepass')
_module='pykeepass'
pkgver=4.0.0
pkgrel=1
pkgdesc="Python library to interact with keepass databases (supports KDBX3 and KDBX4)"
url="https://github.com/libkeepass/pykeepass"
depends=('python2' 'python2-future' 'python2-pycryptodomex' 'python2-construct' 'python2-argon2')
makedepends=('python2-setuptools')
license=('GPL3')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('1b41b3277ea4e044556e1c5a21866ea4dfd36e69a4c0f14272488f098063178f')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
