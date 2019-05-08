# Maintainer: jerry73204 <jerry73204 at google gmail>

pkgname='python-pyct'
pkgver=0.4.6
pkgrel=2
pkgdesc='Python packaging Common Tasks'
arch=('any')
url='https://github.com/pyviz/pyct'
license=('BSD')
makedepends=('python-setuptools' 'python-param')
depends=()
optdepends=('python-pyaml')
optdepends=('python-requests')
checkdepends=('python-pytest'
              'flake8')
source=("https://github.com/pyviz/pyct/archive/v${pkgver}.tar.gz")
sha256sums=('d2be4b605906a63778a700b413c934855f8dd103933cf202d54b005c01a7fd31')

build() {
  cd "${srcdir}/pyct-${pkgver}"
  python setup.py build
}

package_python-pyct() {
  cd "${srcdir}/pyct-$pkgver"
  python setup.py install --skip-build --prefix=/usr --root="${pkgdir}" --optimize=1
  install -D -m644 LICENSE* "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 README* "${pkgdir}/usr/share/doc/${pkgname}/README"
}
