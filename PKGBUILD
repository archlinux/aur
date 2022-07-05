# Maintainer: entriphy <t4ils.dev@gmail.com>

pkgname=python-pillow-avif-plugin
_pkgname=pillow-avif-plugin
pkgver=1.2.2
pkgrel=1
pkgdesc="A Python Pillow plugin that adds AVIF support via libavif"
arch=("any")
url="https://github.com/fdintino/$_pkgname"
license=("BSD")
options=(!emptydirs)
depends=("python" "python-pillow")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools" "python-pytest-runner" "libavif")
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("935f24ecb2a9f6ffb5bbf43d6cebf53740d617bde3ed118be04e587aaf4e727e")

build() {
    cd "$_pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
