# Maintainer: gmes78 <gmes.078 at gmail dot com>

pkgname=python-asyncqt-git
pkgver=v0.7.0.r7.g66ccce1
pkgrel=1
pkgdesc="Implementation of the PEP 3156 Event-Loop with Qt (with PySide2 support) (Git version)"
arch=(any)
url="https://github.com/gmarull/asyncqt"
license=("BSD")

depends=("python")
makedepends=("git" "python-setuptools")
optdepends=("python-pyqt5: PyQt5 support"
            "pyside2: PySide2 support")
provides=("python-asyncqt")
conflicts=("python-asyncqt")

source=("git+https://github.com/gmarull/asyncqt.git")
sha512sums=("SKIP")

pkgver() {
  cd "asyncqt"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "asyncqt"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
