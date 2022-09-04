# Maintainer:  Marco Rubin <marco.rubin@protonmail.com>

_name=qmsolve
pkgname=python-$_name
pkgver=2.0.0
pkgrel=1
pkgdesc="A module for solving and visualizing the Schrödinger equation"
arch=("any")
url="https://github.com/quantum-visualizations/qmsolve"
license=("BSD-3")
depends=(
    'mayavi'
    'python-h5py'
    'python-matplotlib'
    'python-numpy'
    'python-progressbar'
    'python-pyqt5'
    'python-scipy'
    'vtk'
)
makedepends=('python-setuptools')
source=(
    "https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
    "https://github.com/quantum-visualizations/qmsolve/blob/main/LICENSE"
)
sha256sums=(
    '2dd60cd6b086f7b301141666666d3f3b99c66f76bb35b74cdd84b08ddd6a3423'
    'SKIP'
)

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
