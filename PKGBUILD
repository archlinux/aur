# Maintainer: razer <razer[at]neuf[dot]fr>
pkgname=python-adafruit-platformdetect
_pypi_pkgname=Adafruit-PlatformDetect
pkgver=3.17.2
pkgrel=0
pkgdesc="Platform detection for use by libraries like Adafruit-Blinka"
arch=('armv6h' 'armv7h' 'aarch64')
url="https://github.com/adafruit/Adafruit_Python_PlatformDetect"
license=('MIT')
source=("https://pypi.io/packages/source/A/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
makedepends=('python-setuptools' 'python-pip')
depends=('python')
sha256sums=('200f38eb3345981a9251cd285c9d1e039c23e8fcd0dbc8f13b6db3e5634e4f6e')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py build || return 1
}

package() {
  cd "$srcdir/${_pypi_pkgname}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
