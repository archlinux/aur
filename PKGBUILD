# Maintainer: Nagy Roland <roliboy@protonmail.com>

pkgname=python-base91
_pkgname=base91
pkgver=1.0.1
pkgrel=1
pkgdesc='Python implementation of base91'
arch=('any')
url='https://github.com/Fuyukai/base91-python'
license=('New BSD')
depends=('python')
makedepends=('python-setuptools')
source=(
    "https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
    "http://base91.sourceforge.net/license.txt"
)
sha256sums=(
    '5b284a2ba3c97be1eb9473f3af94a9bf141d61005d836e75e645d2798da58799'
    '51f70a0b8d3df8662f97469234af3c8fbf780b8d853568ff9d32b56d6d4b996b'
)

build() {
    cd ${_pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd ${_pkgname}-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
