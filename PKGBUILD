# Maintainer: razer <razer[at]neuf[dot]fr>
pkgname=python-adafruit-platformdetect
_pypi_foldername=Adafruit_PlatformDetect
_pypi_pkgname=adafruit_platformdetect
pkgver=3.85.0
pkgrel=1
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
sha256sums=('58350aa93dd166c4b67ba3c947b07a2d7320d14e65b92e5873fdf64d03e3f93d')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${_pypi_pkgname}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

