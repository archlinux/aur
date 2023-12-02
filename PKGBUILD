# Maintainer: Stuart Cardall <developer at it-offshore dot co dot uk>
pkgname=distrobuilder-menu
pkgver=0.2.7
pkgrel=1
pkgdesc="A python console frontend to Distrobuilder for building standard or customised LXD / LXC images"
arch=(x86_64)
url="https://github.com/itoffshore/distrobuilder-menu"
license=(GPL)
depends=(go-yq python-urllib3 python-yaml)
makedepends=(python-build python-installer python-wheel)
source=($pkgname-$pkgver.tar.gz::${url}/archive/${pkgver}.tar.gz)
md5sums=('32b1516a5ca067c53344b1e0e9e74e6a')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
