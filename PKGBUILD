# Maintainer: selpast <selpast@pm.me>

pkgname=mloader
pkgver=1.1.8
pkgrel=1
pkgdesc='Command-line tool to download manga from mangaplus'
arch=(any)
url='https://github.com/hurlenko/mloader'
license=(GPL3)
depends=(python-click python-protobuf python-requests)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz)
sha256sums=('5fa3d8f09eb60bf5b0fc19d1fdb16460895d5883ee08a6affdff2fb9dc33611a')

build() {
    cd ${pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
