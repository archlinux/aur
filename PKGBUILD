# Maintainer: gmes78 <gmes.078 at gmail dot com>

pkgname=python-asyncqt
pkgver=0.7.0
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
sha512sums=("ca6a52d1dd69ce681dcb61610822a2bb13690e9a320587bb8054d6baafb560b8d4735ad36f4cf18ad3b0ec1841903549afcd6826914d778aeaac95fdf27becc9")

package() {
    cd "asyncqt-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
