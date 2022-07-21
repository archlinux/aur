# Maintainer: selpast <selpast@pm.me>

pkgname=mloader
pkgver=1.1.9
pkgrel=1
pkgdesc='Command-line tool to download manga from mangaplus'
arch=(any)
url='https://github.com/hurlenko/mloader'
license=(GPL3)
depends=(python-click python-protobuf python-requests)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz)
sha256sums=('5e13864cc9efec7cec263c06687a9b8b266d74922c05aa81b0fa0abe8b32ac79')

build() {
    cd ${pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
