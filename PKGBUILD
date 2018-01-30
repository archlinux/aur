pkgbase=('python-gpsoauth')
pkgname=('python-gpsoauth')
_module='gpsoauth'
pkgver='0.4.1'
pkgrel=1
pkgdesc="A python client library for Google Play Services OAuth."
url="https://github.com/simon-weber/gpsoauth"
depends=('python' 'python-requests' 'python-pycryptodomex')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/g/gpsoauth/gpsoauth-${pkgver}.tar.gz")
md5sums=('bdbdcb78b8f14670eac5c47d073e6a05')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
