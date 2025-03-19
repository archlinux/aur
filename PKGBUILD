# Maintainer: Cameron Otsuka <cameron@otsuka.haus>
# Contributor: Cameron Otsuka <cameron@otsuka.haus>
pkgname="python-pyln-bolt7"
_name=${pkgname#python-}
pkgver="25.02"
pkgrel=1
pkgdesc="BOLT7"
arch=("any")
url="https://github.com/ElementsProject/lightning/blob/master/contrib/pyln-spec/bolt7"
license=("custom:BSD-MIT")
depends=("python" "python-pyln-proto")
makedepends=("python-build" "python-installer" "python-poetry" "python-wheel")
source=("https://github.com/ElementsProject/lightning/releases/download/v${pkgver}/clightning-v${pkgver}.zip")
sha256sums=("d34706fc391103047f7ccbae2979a5d90022134c82e9395052a5c42db6c33d11")

build() {
        cd "clightning-v$pkgver"/"contrib"/"pyln-spec"/"bolt7"
        python -m build --wheel --no-isolation
}

package() {
        cd "clightning-v$pkgver"/"contrib"/"pyln-spec"/"bolt7"
        python -m installer --destdir="$pkgdir" dist/*.whl
}
