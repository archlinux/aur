# Maintainer: gmes78 <gmes.078 at gmail dot com>

pkgname=python-asyncqt
pkgver=0.8.0
pkgrel=2
pkgdesc="Implementation of the PEP 3156 Event-Loop with Qt (with PySide2 support)"
arch=(any)
url="https://github.com/gmarull/asyncqt"
license=("BSD")

depends=("python")
makedepends=("python-build" "python-installer" "python-wheel")
optdepends=("python-pyqt5: PyQt5 support"
            "pyside2: PySide2 support")

source=("git+https://github.com/gmarull/asyncqt.git#tag=v$pkgver")
sha512sums=('c96ab9aee9020438ef95f7553ead5c8d659d30070d98d3ac3f291e88fd5e672e9b6d25130c76c9cf9490b39cfdaecafc9b122c38197fd15627346b484da1e9f0')

build() {
    cd asyncqt
    python -m build --wheel --no-isolation
}

package() {
    cd asyncqt
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
