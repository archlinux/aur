# Contributor: jmcb <joelsgp at protonmail dot com>

_name=adafruit-board-toolkit
pkgname=python-$_name
pkgver=1.1.1
pkgrel=1
pkgdesc="CircuitPython board identification and information"
arch=('any')
url="https://github.com/adafruit/Adafruit_Board_Toolkit"
license=('MIT')
depends=('python' 'python-pyserial')
makedepends=('python-setuptools' 'python-pip')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('93c4f09b3b469c2a92e85e59ad74819de7d9cdcda4bee52a6311807a344076c2')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
