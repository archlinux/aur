# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-adafruit-blinka-displayio
_pypi_pkgname=adafruit_blinka_displayio
pkgver=2.1.7
pkgrel=1
pkgdesc="displayio for Blinka"
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/adafruit/Adafruit_Blinka"
license=('MIT')
makedepends=(
'python-build'
'python-installer'
'python-wheel'
'python-setuptools-scm'
)
depends=(
'python-numpy'
'python-adafruit-blinka'
'python-adafruit-circuitpython-typing'
)
optdepends=()
source=("https://pypi.io/packages/source/a/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('4a98bbcab021c6231bb15ed4291ded513c7ec479f11dc7c1a798048bba5aab84')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${_pypi_pkgname}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -vDm644 -t "$pkgdir/usr/share/license/$pkgname" LICENSE
}
