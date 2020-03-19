# Maintainer: gmes78 <gmes.078 at gmail dot com>

pkgname=python-asyncqt
pkgver=0.8.0
pkgrel=1
pkgdesc="Implementation of the PEP 3156 Event-Loop with Qt (with PySide2 support)"
arch=(any)
url="https://github.com/gmarull/asyncqt"
license=("BSD")

depends=("python")
makedepends=("python-setuptools")
optdepends=("python-pyqt5: PyQt5 support"
            "pyside2: PySide2 support")

source=("asyncqt-${pkgver}.tar.gz"::"https://github.com/gmarull/asyncqt/archive/v${pkgver}.tar.gz")
sha512sums=("fdf232404c16f7e95547d5de83163a1e47885dc4dda1a4edf9c3414b75cdb1998588e196f174ef344168f1b07c1d546651ef6adbdacac024e507877b2b96c075")

package() {
    cd "asyncqt-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
