# Maintainer: entriphy <t4ils.dev@gmail.com>

pkgname=python-asyncprawcore
_pkgname=asyncprawcore
pkgver=2.3.0
pkgrel=1
pkgdesc="Low-level asynchronous communication layer for Async PRAW"
arch=("any")
url="https://github.com/praw-dev/$_pkgname"
license=("BSD")
options=(!emptydirs)
depends=("python")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("f3103442eb566f207a577718a72b8054f216ca4970df88ebc8e4fdebb55f91cd")

build() {
    cd "$_pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}