# Maintainer: Radu Potop <radu at wooptoo dot com>
# Contributor: hawkeye116477 <hawkeye116477 at gmail dot com>
# Contributor: Daniel Peukert <daniel@peukert.cc>

upstream_name='PySimpleGUI'
pkgname='python-pysimplegui'
pkgver=6.3
pkgrel=1
pkgdesc='Create GUIs using Python, quickly and easily'
arch=('any')
license=('LGPL-3.0-or-later')
url='https://github.com/PySimpleGUI/PySimpleGUI'
depends=('python' 'tk')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest-runner')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('2cde7cc156ea2223840eaef1685a919ec057d77347ca0eedcd3b64e091b6498b')

build() {
    cd "${upstream_name}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "${upstream_name}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
