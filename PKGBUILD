# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=python-msgspec
_pkgname=msgspec
pkgver=0.11.0
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
sha256sums=('875aea77824173ce083755124ab9db1a58f43615af7fb882969c0c3c279234db')

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
