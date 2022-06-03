# Maintainer: selpast <selpast@pm.me>

pkgname=mloader
pkgver=1.1.7
pkgrel=1
pkgdesc='Command-line tool to download manga from mangaplus'
arch=(any)
url='https://github.com/hurlenko/mloader'
license=(GPL3)
depends=(python-click python-protobuf python-requests)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz)
sha256sums=('3de551c62f6df93950099e2b4ad27077c542001eb39c698aacaff82370b004e9')

build() {
    cd ${pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
