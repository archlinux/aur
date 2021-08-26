# Maintainer: razer <razer[at]neuf[dot]fr>
pkgname=python-adafruit-platformdetect
_pypi_pkgname=Adafruit-PlatformDetect
pkgver=3.15.3
pkgrel=0
pkgdesc="Platform detection for use by libraries like Adafruit-Blinka"
arch=('armv6h' 'armv7h' 'aarch64')
url="https://github.com/adafruit/Adafruit_Python_PlatformDetect"
license=('MIT')
source=("https://pypi.io/packages/source/A/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
makedepends=('python-setuptools' 'python-pip')
depends=('python')
sha256sums=('726782879e1dc18c1b2f50301ab3f04c3a7817a54e35c955ee2bb64a6d60df74')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py build || return 1
}

package() {
  cd "$srcdir/${_pypi_pkgname}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
