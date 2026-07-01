# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: jakka <jakka@jakka.su>

pkgname=python-hydrus
pkgver=5.3.0
pkgrel=1
pkgdesc="Python module implementing the Hydrus API."
arch=(any)
url="https://gitlab.com/cryzed/hydrus-api"
license=(AGPL-3.0-or-later)
depends=(python python-requests)
makedepends=(python-build python-installer python-wheel python-poetry-core)
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/hydrus-api-v$pkgver.tar.gz")
sha512sums=('5941e5ab9163ecad754d5d9fc58c7cf3a79aa7f974cd1ccb37b73495cabeab2a8c9899ce035a184859c9ce417ed871e160b7df0280f68c8af3fb46c268e82215')

build() {
    cd "hydrus-api-v$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "hydrus-api-v$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

