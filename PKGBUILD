# Maintainer: entriphy <t4ils.dev@gmail.com>

pkgname=python-asyncpraw
_pkgname=asyncpraw
pkgver=7.5.0
pkgrel=1
pkgdesc="Asynchronous Python Reddit API wrapper"
arch=("any")
url="https://github.com/praw-dev/$_pkgname"
license=("BSD")
options=(!emptydirs)
depends=("python")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("b2957a53eabef5405960c548b02cd49dca903133059e938375b5cde4b842aac8")

build() {
    cd "$_pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}