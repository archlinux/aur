# Maintainer: razer <razer[at]neuf[dot]fr>
pkgname=python-adafruit-platformdetect
_pypi_pkgname=Adafruit-PlatformDetect
pkgver=3.14.0
pkgrel=0
pkgdesc="Platform detection for use by libraries like Adafruit-Blinka"
arch=('armv6h' 'armv7h' 'aarch64')
url="https://github.com/adafruit/Adafruit_Python_PlatformDetect"
license=('MIT')
source=("https://pypi.io/packages/source/A/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
makedepends=('python-setuptools' 'python-pip')
depends=('python')
sha256sums=('10a1d53347da76028c12c6d5bf73a4123bc44a0eb1c28aa6a94b53c70c2963ec')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py build || return 1
}

package() {
  cd "$srcdir/${_pypi_pkgname}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
