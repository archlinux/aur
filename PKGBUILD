pkgname=python-msgspec
_pkgname=msgspec
pkgver=0.15.0
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
sha256sums=('46115ae3de7572f014610008b8fc3309ac18077576bed828faa6faeb5cf08eef')

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
