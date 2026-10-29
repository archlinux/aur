# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="mkdocs-exclude-search-plugin"
pkgver=0.6.7
pkgrel=2
pkgdesc="MkDocs plugin that lets you exclude selected files or sections from the search index"
url="https://github.com/chrieke/mkdocs-exclude-search"
license=("MIT")
arch=("any")
depends=("python" "mkdocs")
makedepends=("python-build" "python-installer" "python-setuptools" "python-wheel")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('bca57bb442c2094af1e71b67b6af4cb8c56be1e2f687693bdbdc75f87d7db2ef')

build(){
 cd "mkdocs-exclude-search-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "mkdocs-exclude-search-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
