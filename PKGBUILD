# Maintainer: Radu Potop <radu at wooptoo dot com>
# Contributor: hawkeye116477 <hawkeye116477 at gmail dot com>
# Contributor: Daniel Peukert <daniel@peukert.cc>

upstream_name='PySimpleGUI'
pkgname='python-pysimplegui'
pkgver=6.2
pkgrel=1
pkgdesc='Create GUIs using Python, quickly and easily'
arch=('any')
license=('LGPL-3.0-or-later')
url='https://github.com/PySimpleGUI/PySimpleGUI'
depends=('python' 'tk')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest-runner')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('8c7cb01abf805a859b05743267e23c28ad554c101f701beba718788713f22995')

build() {
    cd "${upstream_name}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "${upstream_name}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
