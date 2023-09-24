# Maintainer: selpast <selpast@pm.me>

pkgname=mloader
pkgver=1.1.11
pkgrel=1
pkgdesc='Command-line tool to download manga from mangaplus'
arch=(any)
url='https://github.com/hurlenko/mloader'
license=(GPL3)
depends=(python-click python-protobuf python-requests)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz)
sha256sums=('38e26a737a098f21799aaaa95539b6f5dd3d8698fdc96efd05886392f4040d8c')

build() {
    cd ${pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
