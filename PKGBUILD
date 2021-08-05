# Maintainer: Sergey G <introkun at gmail dot com>
# Contributor: Rick <riyyi3 at gmail dot com>

_pkgname=qt-range-slider
pkgname=python-${_pkgname}
pkgver=0.2.3
pkgrel=1
pkgdesc='Qt widget-slider with two thumbs (min/max values)'
arch=('any')
url='https://github.com/introkun/qt-range-slider'
_url_pypi='https://pypi.org/project/qt-range-slider'
license=('MIT')
depends=('python' 'python-pyqt5')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('05eb81f4c236d0541a5c24feeca49204b1391f4124c400d8f3c9b5a44548f78f')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize 1 --skip-build

  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}
