# Maintainer: Radu Potop <radu at wooptoo dot com>
# Contributor: hawkeye116477 <hawkeye116477 at gmail dot com>
# Contributor: Daniel Peukert <daniel@peukert.cc>

_name='PySimpleGUI'
pkgname='python-pysimplegui'
pkgver=6.4
pkgrel=1
pkgdesc='Create GUIs using Python, quickly and easily'
arch=('any')
license=('LGPL-3.0-or-later')
url='https://github.com/PySimpleGUI/PySimpleGUI'
depends=('python' 'tk')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest-runner')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('4c218e1190da0dcb6cd74ec179426a0f9bbc9cdd0019d888018c3619ba23ffbf')

build() {
    cd "${_name}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
