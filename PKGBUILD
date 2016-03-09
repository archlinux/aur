# Maintainer: valère monseur <valere dot monseur at ymail dot com>

pkgname=python-livereload
_pkgname=livereload
pkgver=2.4.1
pkgrel=1
pkgdesc='Python LiveReload is an awesome tool for web developers'
arch=('any')
url="https://pypi.python.org/pypi/livereload"
license=('BSD')
depends=('python-six' 'python-tornado')
makedepends=('python-setuptools')
replaces=('livereload')
conflicts=('livereload')
source=("https://pypi.python.org/packages/source/l/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('887cc9976d72d7616fa57c82c4ef5bf5da27e2350dfd6f65d3f44e86efc51b92')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" -O1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
