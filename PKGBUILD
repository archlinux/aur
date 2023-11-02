# Maintainer: Vanya A. Sergeev <v@sergeev.io>
pkgname=rigexpert-tool
pkgver=1.0.0
pkgrel=2
pkgdesc="Dump, plot, and convert impedance sweeps from a RigExpert antenna analyzer"
arch=('any')
url="https://github.com/vsergeev/rigexpert-tool"
license=('MIT')
depends=('python-pyserial' 'python-matplotlib' 'python-scipy')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
source=("git+https://github.com/vsergeev/rigexpert-tool.git#tag=v$pkgver")
md5sums=('SKIP')

build() {
    cd "$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
