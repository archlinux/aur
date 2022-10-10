# Maintainer: coloursofnoise <coloursofthenoise at google mail>
pkgname=python-dnfile
_name=${pkgname#python-}
pkgver=0.12.0
pkgrel=1
pkgdesc="Python .NET executable parsing module"
url="https://github.com/malwarefrank/dnfile"
arch=('any')
license=('MIT')
depends=('python' 'python-pefile')
makedepends=('python-setuptools')
source=("${_name}-${pkgver}::${url}/archive/v${pkgver}/${_name}-${pkgver}.tar.gz")
sha256sums=('64f2647561352c86edba8d9156bff7ebccb1746c8855219b2c3cd8a968985210')

build() {
    cd "${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
