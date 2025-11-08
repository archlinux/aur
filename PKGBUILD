# Maintainer: mrbooo895 | kwkkna3@gmail.com

pkgname=python-pyinit
pkgver=1.0.6
pkgrel=1
pkgdesc="A powerful CLI tool for creating and managing the entire lifecycle of Python projects."
arch=('any')
url="https://github.com/mrbooo895/pyinit"
license=('MIT')
depends=('python' 'python-rich' 'python-tomli' 'python-tomli-w' 'python-importlib-resources')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-packaging')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('6e1c0d73a36c516cc77daa5a3ec64aa32a301a6bfbf2b5882ae75e9a9cc7d57c')
build() {
    cd "pyinit-$pkgver"
    python -m build --wheel --sdist --no-isolation
}

package() {
    cd "pyinit-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -d "$pkgdir/usr/share/pyinit/"
}
