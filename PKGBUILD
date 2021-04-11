# Maintainer: John Gerritse <tyrannis dot hawk at gmail dot com>

pkgname=python-symspellpy
_pkgname=symspellpy
pkgver=6.7.0
pkgrel=1
pkgdesc="Python SymSpell"
arch=('any')
url="https://github.com/mammothb/symspellpy"
license=('MIT')
depends=('python' 'python-setuptools')
source=(
    ${pkgname}-${pkgver}.tar.gz::https://github.com/mammothb/symspellpy/archive/v${pkgver}.tar.gz
)
sha256sums=('809361d6910e0d41dc3bf700417ac35ac66947fcf0843de20f9e4b2876d4e1bb')

build() {
    cd "${_pkgname}-${pkgver}"
    LANG=en_US.UTF-8 python setup.py build
}

package() {
    cd "${_pkgname}-${pkgver}"
    LANG=en_US.UTF-8 python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
