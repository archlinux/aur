# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-adafruit-circuitpython-typing
_pypi_pkgname=adafruit-circuitpython-typing
pkgver=1.10.3
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
sha256sums=('4c5c1eeb3ae8a3d2dfa75129654c73690fbdb576d9069542a6ea3355467e1e74')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -vDm644 -t "$pkgdir/usr/share/license/$pkgname" LICENSE
}
