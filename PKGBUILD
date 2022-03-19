# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Mohamed Sobh <mohamed.alhusieny@gmail.com>

pkgname=python-zipline
_pkgname=${pkgname:7}
pkgver=1.4.1
pkgrel=1
pkgdesc="A backtester for financial algorithms."
arch=('any')
url="https://www.zipline.io"
license=('APACHE')
depends=(
  'python-pandas'
  'python-dateutil'
  'python-pytz'
  'python-logbook'
  'python-requests'
  'ta-lib'
)
makedepends=(python-build python-installer python-wheel)
source=("https://pypi.python.org/packages/source/${pkgname:7:1}/${pkgname:7}/${pkgname:7}-${pkgver}.tar.gz")
sha256sums=('fda2b8fd324c0f02cc0b5a00d4a0c42e256e9c8c0118a5cbf0fba69996076d10')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
# vim:set ts=2 sw=2 et:
