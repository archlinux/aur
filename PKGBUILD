# Maintainer: razer <razer[at]neuf[dot]fr>
pkgname=python-adafruit-platformdetect
_pypi_pkgname=Adafruit-PlatformDetect
pkgver=3.62.0
pkgrel=0
pkgdesc="Platform detection for use by libraries like Adafruit-Blinka"
arch=('any')
url="https://github.com/adafruit/Adafruit_Python_PlatformDetect"
license=('MIT')
source=("https://pypi.io/packages/source/A/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
makedepends=(
'python-build'
'python-installer'
'python-wheel'
'python-setuptools-scm'
)
depends=('python')
sha256sums=('2f609ba96ab23a8e26abe2ac3bc1580321c29512855cc2d65ad7d8120d120f7e')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${_pypi_pkgname}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
