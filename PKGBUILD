# Maintainer: robertfoster

_name=unoserver
pkgname="python-${_name}"
pkgver=3.3 # renovate: datasource=github-tags depName=unoconv/unoserver
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

sha256sums=('2a6a3835855a69102910dc0177ed153c667d2bee278862c2057e12030328cc0a')
