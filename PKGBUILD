# Maintainer: entriphy <t4ils.dev@gmail.com>

pkgname=python-pyrogram
_pkgname=pyrogram
pkgver=2.0.97
pkgrel=1
pkgdesc="Elegant, modern and asynchronous Telegram MTProto API framework in Python for users and bots"
arch=("any")
url="https://github.com/pyrogram/$_pkgname"
license=("GPL3")
options=(!emptydirs)
depends=("python" "python-pyaes" "python-pysocks")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("619608661ec19f95825589abbf298f430f6559ad5f6f58401ab82b547d9ea89a")

build() {
    cd "$_pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
