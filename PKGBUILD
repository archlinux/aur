# Maintainer: Sergey G <introkun at gmail dot com>
# Contributor: Rick <riyyi3 at gmail dot com>

_pkgname=qt-range-slider
pkgname=python-${_pkgname}
pkgver=0.2.6
pkgrel=1
pkgdesc='Qt widget-slider with two thumbs (min/max values)'
arch=('any')
url='https://github.com/introkun/qt-range-slider'
_url_pypi='https://pypi.org/project/qt-range-slider'
license=('MIT')
depends=('python' 'python-pyqt5')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('998f019ba8d73af3a3bbd2676bdaa1a3c7ffecf3d89e30297a440226c7def328')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize 1 --skip-build

  install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}
