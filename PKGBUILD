# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="mkdocs-exclude-search-plugin"
pkgver=0.6.4
pkgrel=2
pkgdesc="MkDocs plugin that lets you exclude selected files or sections from the search index"
url="https://github.com/chrieke/mkdocs-exclude-search"
license=("MIT")
arch=("any")
depends=("mkdocs")
makedepends=("python-build" "python-installer" "python-setuptools" "python-wheel")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('5aaea16b2b3e212af427f6bcdc3bb87b0ccaad4d080ab2956711678a2361cfde')

build(){
 cd "mkdocs-exclude-search-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "mkdocs-exclude-search-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
