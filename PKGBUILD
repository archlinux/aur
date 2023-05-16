# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-adafruit-circuitpython-typing
_pypi_pkgname=adafruit-circuitpython-typing
pkgver=1.9.2
pkgrel=0
pkgdesc="Definitions not in the standard typing module that are needed for type annotation of CircuitPython code"
arch=('any')
url="https://github.com/adafruit/Adafruit_CircuitPython_Typing"
license=('MIT')
makedepends=(
'python-build'
'python-installer'
'python-wheel'
'python-setuptools-scm'
)
depends=('python')
optdepends=()
source=("https://pypi.io/packages/source/a/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('e6499ec0bc48f20680b357b2f39dfa901e47368d8ae5aae6ccfa682f0c69ad4e')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -vDm644 -t "$pkgdir/usr/share/license/$pkgname" LICENSE
}
