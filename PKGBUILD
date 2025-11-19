# Maintainer: robertfoster

_name=unoserver
pkgname="python-${_name}"
pkgver=3.5 # renovate: datasource=github-tags depName=unoconv/unoserver
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

sha256sums=('01b2dcaf081a377f9543c34355eadfb3aa1f41d2f1b2b2a5c0732f50fe513576')
