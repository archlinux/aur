# Maintainer:
# Contributor: Evgeniy Filimonov <evgfilim1 at gmail dot com>

_pyname='magic-filter'
pkgname="python-${_pyname}"
pkgver=1.0.12
pkgrel=1
pkgdesc="A filter package based on dynamic attribute getter"
arch=('any')
url="https://github.com/aiogram/${_pyname}"
license=('MIT')
depends=(
    'python'
)
makedepends=(
    'python-build'
    'python-hatchling'
    'python-installer'
)
source=(https://github.com/aiogram/magic-filter/archive/v$pkgver/$_pyname-$pkgver.tar.gz)
sha256sums=('e1bdaddbc2090a13883956c55bd0dd5b8affd0eeb825ce19ec5e891247f7c0cf')

build() {
    cd ${_pyname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${_pyname}-${pkgver}
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

# vim: ft=sh ts=4 sw=4 et
