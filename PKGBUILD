# Maintainer: jerry73204 <jerry73204 at google gmail>

pkgname='python-pyviz_comms'
pkgver=0.7.2
pkgrel=2
pkgdesc='Bidirectional communication for the PyViz ecosystem'
arch=('any')
url='https://github.com/pyviz/pyviz_comms'
license=('BSD')
makedepends=('python-setuptools'
             'python-param')
depends=()
checkdepends=('python-nose'
              'flake8')
source=("https://github.com/pyviz/pyviz_comms/archive/v${pkgver}.tar.gz")
sha256sums=('24978f18895c1655364083a464d7327d6cc848ad67ffca40237bfaaa3d8de5c8')

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
