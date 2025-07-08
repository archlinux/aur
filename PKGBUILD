# Maintainer: robertfoster

_name=unoserver
pkgname="python-${_name}"
pkgver=3.3.2 # renovate: datasource=github-tags depName=unoconv/unoserver
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

sha256sums=('93d7d4681cfb14f518ae13a67cd03049aa5c279e4e8cb26a329dbe9ae821233b')
