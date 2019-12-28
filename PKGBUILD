# Maintainer: gmes78 <gmes.078 at gmail dot com>

pkgname=python-qasync
pkgver=0.9.3
pkgrel=1
pkgdesc="Python library for using asyncio in Qt-based applications"
arch=(any)
url="https://github.com/CabbageDevelopment/qasync"
license=("BSD")

depends=("python")
makedepends=("python-setuptools")
optdepends=("python-pyqt5: PyQt5 support"
            "pyside2: PySide2 support")

source=("qasync::git+https://github.com/CabbageDevelopment/qasync.git#commit=1d83438bf77f10e96ec8b93493780defcc4a444b")
sha512sums=("SKIP")

package() {
    cd qasync
    python setup.py install --root="$pkgdir/" --optimize=1
    install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}
