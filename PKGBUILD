# Maintainer: Romain Labolle <aur@labolle.eu>
# Contributor: Lorenz Steinert <lorenz@steinerts.de>
pkgname=python-icalevents
_name=${pkgname#python-}
pkgver=0.3.2
pkgrel=1
pkgdesc="Python module for iCal URL/file parsing and querying."
arch=(any)
url="https://github.com/jazzband/icalevents"
license=('MIT')
depends=('python-icalendar' 'python-dateutil' 'python-pytz' 'python-urllib3')
makedepends=(python-build python-installer python-wheel python-poetry-core)
optdepends=()
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('fd0642c8a702d3b452e373308dd68a7cb4c43133b885c6a1a5b88c65c47e241f')

build() {
  cd "$_name-$pkgver"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
