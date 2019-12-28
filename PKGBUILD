# Maintainer: gmes78 <gmes.078 at gmail dot com>

pkgname=python-qasync-git
pkgver=v0.9.1.r5.g1d83438
pkgrel=1
pkgdesc="Python library for using asyncio in Qt-based applications"
arch=(any)
url="https://github.com/CabbageDevelopment/qasync"
license=("BSD")

depends=("python")
makedepends=("git" "python-setuptools")
optdepends=("python-pyqt5: PyQt5 support"
            "pyside2: PySide2 support")
provides=("python-qasync")
conflicts=("python-qasync")

source=("qasync::git+https://github.com/CabbageDevelopment/qasync.git")
sha512sums=("SKIP")

pkgver() {
    cd qasync
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd qasync
    python setup.py install --root="$pkgdir/" --optimize=1
    install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}
