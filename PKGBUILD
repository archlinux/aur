pkgname=python-msgspec
_pkgname=msgspec
pkgver=0.18.5
pkgrel=1
pkgdesc='A fast and friendly JSON/MessagePack library, with optional schema validation'
arch=(any)
url="https://jcristharif.com/msgspec/"
license=("BSD")
depends=(
    "python"
)
makedepends=("python-build" "python-installer" "git")
source=("https://github.com/jcrist/msgspec/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('e10b758ab3b063c1674119da5105e4ee69353481b95f1d0538ff29c117de3a04')

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
