# Maintainer: Cameron Otsuka <cameron@otsuka.haus>
# Contributor: Cameron Otsuka <cameron@otsuka.haus>
pkgname="python-pyln-bolt7"
_name=${pkgname#python-}
pkgver="1.0.4.246"
pkgrel=1
epoch=1
pkgdesc="BOLT7"
arch=("any")
url="https://github.com/ElementsProject/lightning/blob/master/contrib/pyln-spec/bolt7"
license=("custom:BSD-MIT")
depends=("python" "python-pyln-proto")
makedepends=("python-build" "python-installer" "python-poetry" "python-wheel")
source=("https://github.com/ElementsProject/lightning/releases/download/v${pkgver}/clightning-v${pkgver}.zip")
sha256sums=("a97f44647b83b44718094f1838c6c74e8dc90c0009f2773a37b17ff80004a67e")

build() {
        cd "clightning-v$pkgver"/"contrib"/"pyln-spec"/"bolt7"
        python -m build --wheel --no-isolation
}

package() {
        cd "clightning-v$pkgver"/"contrib"/"pyln-spec"/"bolt7"
        python -m installer --destdir="$pkgdir" dist/*.whl
}
