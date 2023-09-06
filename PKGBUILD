pkgname=python-msgspec
_pkgname=msgspec
pkgver=0.18.2
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
sha256sums=('624a157b7e4ded9f5709b748065bf68cca0959a874f76d8fe6aa058f6ea8118b')

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
