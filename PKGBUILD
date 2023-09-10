# Maintainer: Nagy Roland <roliboy@protonmail.com>

pkgname=python-base91
_pkgname=base91
pkgver=1.0.1
pkgrel=2
pkgdesc='Python implementation of base91'
arch=('any')
url='https://sourceforge.net/projects/base91/'
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=(
    "https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
)
sha256sums=('5b284a2ba3c97be1eb9473f3af94a9bf141d61005d836e75e645d2798da58799')

build() {
    cd ${_pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd ${_pkgname}-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
