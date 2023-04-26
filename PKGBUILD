# Maintainer: Evgeniy Filimonov <evgfilim1 at gmail dot com>

_pyname='magic-filter'
pkgname="python-${_pyname}"
pkgver=1.0.0
pkgrel=3
pkgdesc="A filter package based on dynamic attribute getter"
arch=('any')
url="https://github.com/aiogram/${_pyname}"
license=('MIT')
depends=(
    'python>=3.6.2'
)
makedepends=(
    'python-setuptools'
)
source=("https://pypi.python.org/packages/source/${_pyname::1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('6c1e8d185cd540606555a07a7c78d9c36bf0c97b9cd6e0a00da65dd38d56026f')
provides=("python-${_pyname}")
conflicts=("python-${_pyname}")

build() {
    cd "$srcdir/${_pyname}-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/${_pyname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

# vim: ft=sh ts=4 sw=4 et
