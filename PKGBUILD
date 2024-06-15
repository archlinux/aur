# Maintainer: razer <razer[at]neuf[dot]fr>
pkgname=python-adafruit-platformdetect
_pypi_foldername=Adafruit_PlatformDetect
_pypi_pkgname=adafruit_platformdetect
pkgver=3.69.0
pkgrel=0
pkgdesc="Platform detection for use by libraries like Adafruit-Blinka"
arch=('any')
url="https://github.com/adafruit/Adafruit_Python_PlatformDetect"
license=('MIT')
source=("https://pypi.io/packages/source/A/${_pypi_foldername}/${_pypi_pkgname}-${pkgver}.tar.gz")
makedepends=(
'python-build'
'python-installer'
'python-wheel'
'python-setuptools-scm'
)
depends=('python')
sha256sums=('27ee15480fb6c5908da0bac808d5e99881bcb54e9c9ce9f81231273755451985')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${_pypi_pkgname}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

