# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=python-pyxcp
_pkgname=pyxcp
pkgver=0.18.51
_commit="83f958371c9650ed838dfa6857c51fe65111e75c"
pkgrel=1
pkgdesc='Utilities for managing the clipboard using OSC52'
arch=(any)
url="https://github.com/rumpelsepp/oscclip"
license=("GPLv3")
depends=("python"
    "python-mako"
    "python-construct"
    "python-pyserial"
    "python-pyusb"
    "python-toml"
    "python-can"
)
makedepends=("python-installer" "python-build" "pybind11" "python-setuptools" "python-pep517")
optdepends=()
source=("git+https://github.com/Christoph2/pyxcp#commit=$_commit")
sha256sums=('SKIP')

build() {
    cd "$_pkgname"
	python -m build
}

package() {
    cd "$_pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
