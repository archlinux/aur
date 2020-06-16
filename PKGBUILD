# Maintainer: jerry73204 <jerry73204 at google gmail>

pkgname='python-pyviz_comms'
pkgver=0.7.5
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
sha256sums=('4f16b773fa8a3088c34f2dd1fb51865b5083400c5b70939aa9de5edc54cfec43')
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
