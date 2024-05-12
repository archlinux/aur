# Maintainer: razer <razer[at]neuf[dot]fr>
pkgname=python-adafruit-platformdetect
_pypi_foldername=Adafruit_PlatformDetect
_pypi_pkgname=adafruit_platformdetect
pkgver=3.63.0
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
sha256sums=('6e7b5c3ff3f47a842c8c84107092edb17b0f712ca5295354a7e7ff442fd4e66e')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${_pypi_pkgname}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

