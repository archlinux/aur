pkgname=python-ulid
_pkgname=python_ulid
pkgver=2.2.0
pkgrel=1
pkgdesc='Universally unique lexicographically sortable identifier'
arch=(any)
url="https://pypi.org/project/python-ulid/"
license=("MIT")
depends=("python")
makedepends=("python-hatch" "python-installer")
source=("https://files.pythonhosted.org/packages/a8/fc/bcffc20e99ecf96652df2ad5c7dce470dfdbac750cbd92de82cbbc5efe97/$_pkgname-$pkgver.tar.gz")

build() {
    cd "$_pkgname-$pkgver"
    hatch build --clean
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
sha256sums=('9ec777177d396880d94be49ac7eb4ae2cd4a7474448bfdbfe911537add970aeb')
