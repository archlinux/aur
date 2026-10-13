# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: jakka <jakka@jakka.su>

pkgname=python-hydrus
pkgver=5.4.0
pkgrel=1
pkgdesc="Python module implementing the Hydrus API."
arch=(any)
url="https://gitlab.com/cryzed/hydrus-api"
license=(AGPL-3.0-or-later)
depends=(python python-requests)
makedepends=(python-build python-installer python-wheel python-poetry-core)
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/hydrus-api-v$pkgver.tar.gz")
sha512sums=('7e4a4463bd7572ff2afab4ce358d070ed8d591c38f97bc23c5eebd22e3e74c22800ad1deacb8b91e611f9fdaf425c3441cfa7e0697f8d2d6defe9bbb15d8453a')

build() {
    cd "hydrus-api-v$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "hydrus-api-v$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

