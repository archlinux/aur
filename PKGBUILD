# Maintainer: jakepys
pkgname=pyrgbtohex
pkgver=0.1.0
pkgrel=1
pkgdesc="Simple GUI RGB to Hex"
arch=('any')
url="https://pypi.org/project/pyrgbtohex"
license=('GPL-3.0-or-later')
depends=('python' 'python-pyqt6')
makedepends=('python-build' 'python-installer' 'python-hatchling')
source=("https://files.pythonhosted.org/packages/source/p/pyrgbtohex/pyrgbtohex-$pkgver.tar.gz")
sha256sums=('be3b74b481bca3bb21718d7109db48a204227763a6ad67f2dbcc05a9bbd1e748')

build() {
    cd "$srcdir/pyrgbtohex-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/pyrgbtohex-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
