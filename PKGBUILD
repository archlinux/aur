# Maintainer:
# Contributor: Evgeniy Filimonov <evgfilim1 at gmail dot com>

_pyname='magic-filter'
pkgname="python-${_pyname}"
pkgver=1.0.9
pkgrel=3
pkgdesc="A filter package based on dynamic attribute getter"
arch=('any')
url="https://github.com/aiogram/${_pyname}"
license=('MIT')
depends=(
    'python'
)
makedepends=(
    'python-setuptools'
)
source=("https://pypi.python.org/packages/source/${_pyname::1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('d0f1ffa5ff1fbe5105fd5f293c79b5d3795f336ea0f6129c636959a687bf422a')

build() {
    cd ${_pyname}-${pkgver}
    python setup.py build
}

package() {
    cd ${_pyname}-${pkgver}
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

# vim: ft=sh ts=4 sw=4 et
