# Maintainer: Cameron Otsuka <cameron@otsuka.haus>
# Contributor: Cameron Otsuka <cameron@otsuka.haus>
pkgname="python-pyln-bolt7"
_name=${pkgname#python-}
pkgver="24.02.2"
pkgrel=1
pkgdesc="BOLT7"
arch=("any")
url="https://github.com/ElementsProject/lightning/blob/master/contrib/pyln-spec/bolt7"
license=("custom:BSD-MIT")
depends=("python" "python-pyln-proto")
makedepends=("python-build" "python-installer" "python-poetry" "python-wheel")
source=("https://github.com/ElementsProject/lightning/releases/download/v${pkgver}/clightning-v${pkgver}.zip")
sha256sums=("2904bfe15994c4990da6f3dcc4be54a7d7f6e657a23f3be2d8088abb3450983a")

build() {
        cd "clightning-v$pkgver"/"contrib"/"pyln-spec"/"bolt7"
        python -m build --wheel --no-isolation
}

package() {
        cd "clightning-v$pkgver"/"contrib"/"pyln-spec"/"bolt7"
        python -m installer --destdir="$pkgdir" dist/*.whl
}
