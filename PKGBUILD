# Maintainer: razer <razer[at]neuf[dot]fr>
pkgname=python-adafruit-platformdetect
_pypi_pkgname=Adafruit-PlatformDetect
pkgver=3.41.0
pkgrel=1
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
sha256sums=('356758d7292e17c998c573c2c1a56aea61244171eb526844cbf0570c5627d95d')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py build || return 1
}

package() {
  cd "$srcdir/${_pypi_pkgname}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
