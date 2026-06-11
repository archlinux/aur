# Maintainer: robertfoster

_name=unoserver
pkgname="python-${_name}"
pkgver=3.7 # renovate: datasource=github-tags depName=unoconv/unoserver
pkgrel=1
pkgdesc="Using LibreOffice as a server for converting documents"
arch=('any')
depends=('python')
makedepends=(python-build python-installer python-setuptools python-wheel)
url="https://github.com/unoconv/unoserver"
license=('MIT')
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/$pkgver.tar.gz")

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}

sha256sums=('c68b6a0d901fabb0c51375f119565c189e6651b46ed3a7dbf8e0231f6e4fd415')
