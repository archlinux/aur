# Maintainer: jerry73204 <jerry73204 at google gmail>

pkgname='python-pyviz_comms'
pkgver=0.7.6
pkgrel=1
pkgdesc='Bidirectional communication for the PyViz ecosystem'
arch=('any')
url='https://github.com/pyviz/pyviz_comms'
license=('BSD')
makedepends=('python-setuptools')
depends=('python-param')
checkdepends=('python-nose'
              'flake8')
source=("https://github.com/pyviz/pyviz_comms/archive/v${pkgver}.tar.gz")
sha256sums=('9f273a69e9ebc73e25edc12a03996e0d7f21f793be09bf4511a09489612256a2')
build() {
  cd "${srcdir}/pyviz_comms-${pkgver}"
  python setup.py build
}

package_python-pyviz_comms() {
  cd "${srcdir}/pyviz_comms-$pkgver"
  python setup.py install --skip-build --prefix=/usr --root="${pkgdir}" --optimize=1
  install -D -m644 LICENSE* "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 README* "${pkgdir}/usr/share/doc/${pkgname}/README"
}
