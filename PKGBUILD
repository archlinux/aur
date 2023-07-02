# Maintainer: entriphy <t4ils.dev@gmail.com>

pkgname=python-asyncpraw
_pkgname=asyncpraw
pkgver=7.7.0
pkgrel=1
pkgdesc="Asynchronous Python Reddit API wrapper"
arch=("any")
url="https://github.com/praw-dev/$_pkgname"
license=("BSD")
options=(!emptydirs)
depends=("python" "python-asyncprawcore" "python-aiofiles" "python-asyncio_extras")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("3d1fccc6c43a5ce60f8be4d80238e24592e9de7a26cb5604cd184dd540bd8fd5")

build() {
    cd "$_pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
