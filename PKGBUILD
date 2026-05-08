# Maintainer: Radu Potop <radu at wooptoo dot com>
# Contributor: hawkeye116477 <hawkeye116477 at gmail dot com>
# Contributor: Daniel Peukert <daniel@peukert.cc>

upstream_name='PySimpleGUI'
pkgname='python-pysimplegui'
pkgver=6.0
pkgrel=1
pkgdesc='Create GUIs using Python, quickly and easily'
arch=('any')
license=('LGPL-3.0-or-later')
url='https://github.com/PySimpleGUI/PySimpleGUI'
depends=('python' 'tk')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest-runner')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('4c58510c3135505a3ecf3193d116a4322130bcbdaa1d0e064638a05d0ac238fd')

build() {
    cd "${upstream_name}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "${upstream_name}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
