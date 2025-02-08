# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-adafruit-circuitpython-bitmap-font
_pypi_pkgname=adafruit_circuitpython_bitmap_font
pkgver=2.1.4
pkgrel=0
pkgdesc="Loads bitmap fonts into CircuitPython displayio"
arch=('any')
url="https://github.com/adafruit/Adafruit_CircuitPython_Bitmap_Font"
license=('MIT')
makedepends=(
'python-build'
'python-installer'
'python-wheel'
'python-setuptools-scm'
)
depends=()
optdepends=()
source=("https://pypi.io/packages/source/a/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('64f24b82133e4dd3221438252543c7001ca6e835c70f8f9e3b32bbf344912942')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
