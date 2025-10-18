# Maintainer: Cameron Otsuka <cameron@otsuka.haus>
# Contributor: Cameron Otsuka <cameron@otsuka.haus>
pkgname="python-pyln-bolt7"
_name=${pkgname#python-}
pkgver="1.0.4.246"
_clightning_pkgver="25.09.1"
pkgrel=5
epoch=1
pkgdesc="BOLT7"
arch=("any")
url="https://github.com/ElementsProject/lightning/blob/master/contrib/pyln-spec/bolt7"
license=("custom:BSD-MIT")
depends=("python" "python-pyln-proto")
makedepends=("python-build" "python-installer" "python-hatchling" "python-wheel")
source=("https://github.com/ElementsProject/lightning/releases/download/v${_clightning_pkgver}/clightning-v${_clightning_pkgver}.zip")
sha256sums=("99a1fe49232e9d71f8dc797d145be4e4bea7e1ed3abe0b0bdd3f16df2772fa14")

build() {
        cd "clightning-v$_clightning_pkgver"/"contrib"/"pyln-spec"/"bolt7"
        python -m build --wheel --no-isolation
}

package() {
        cd "clightning-v$_clightning_pkgver"/"contrib"/"pyln-spec"/"bolt7"
        python -m installer --destdir="$pkgdir" dist/*.whl
}
