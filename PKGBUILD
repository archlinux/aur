pkgbase='python2-pycrypto26'
pkgname=('python2-pycrypto26')
_module='pycrypto'
pkgver='2.6'
pkgrel=1
pkgdesc="Cryptographic modules for Python."
url="http://www.pycrypto.org/"
depends=('python2')
makedepends=('python2-setuptools')
license=('custom:Public Domain')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module/-/_}-$pkgver.tar.gz")
sha256sums=('7293c9d7e8af2e44a82f86eb9c3b058880f4bcc884bf3ad6c8a34b64986edde8')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
