# Maintainer: entriphy <t4ils.dev@gmail.com>

pkgname=python-asyncpraw
_pkgname=asyncpraw
pkgver=7.7.1
pkgrel=1
pkgdesc="Asynchronous Python Reddit API wrapper"
arch=("any")
url="https://github.com/praw-dev/$_pkgname"
license=("BSD")
options=(!emptydirs)
depends=("python" "python-asyncprawcore" "python-aiofiles")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("e20b8e00979c9de092334a3c1b2a0ca57a6647e41add2ee647d4a957f109ff1e")

build() {
    cd "$_pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
