# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=python-msgspec
_pkgname=msgspec
pkgver=0.14.0
pkgrel=1
pkgdesc='A fast and friendly JSON/MessagePack library, with optional schema validation'
arch=(any)
url="https://github.com/Fraunhofer-AISEC/gallia"
license=("BSD")
depends=(
    "python"
)
makedepends=("python-build" "python-installer" "git")
source=("https://github.com/jcrist/msgspec/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('d53acf64ac48c3f704de59d5b0935e337d2d2d18b04af6934d9bf89d8251e41e')

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
