# Maintainer: John Gerritse <tyrannis dot hawk at gmail dot com>

pkgname=python-symspellpy
_pkgname=symspellpy
pkgver=6.5.2
pkgrel=1
pkgdesc="Python SymSpell"
arch=('any')
url="https://github.com/mammothb/symspellpy"
license=('MIT')
depends=('python' 'python-setuptools')
source=(
    ${pkgname}-${pkgver}.tar.gz::https://github.com/mammothb/symspellpy/archive/v${pkgver}.tar.gz
)
sha256sums=('60c44186dd3a993f08887c09af14cb75635dff7570b5bf045f5d9360792e3fec')

build() {
    cd "${_pkgname}-${pkgver}"
    LANG=en_US.UTF-8 python setup.py build
}

package() {
    cd "${_pkgname}-${pkgver}"
    LANG=en_US.UTF-8 python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
