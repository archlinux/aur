# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-autograd'
_pkgname='autograd'
pkgver='1.6.2'
pkgrel=1
pkgdesc="Efficiently computes derivatives of numpy code"
url="https://github.com/HIPS/autograd"
depends=('python'
    'python-future'
    'python-numpy'
    'python-scipy')
checkdepends=()
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('8731e08a0c4e389d8695a40072ada4512641c113b6cace8f4cfbe8eb7e9aedeb')

build() {
    cd "${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --skip-build --optimize=1
}

