# Maintainer: JakobDev <jakobdev at gmx dot de>
# Contributor: entriphy <t4ils.dev@gmail.com>

pkgname=python-pillow-avif-plugin
_pkgname=pillow-avif-plugin
pkgver=1.4.6
pkgrel=1
pkgdesc="A Python Pillow plugin that adds AVIF support via libavif"
arch=("any")
url="https://github.com/fdintino/$_pkgname"
license=("BSD")
options=(!emptydirs)
depends=("python" "python-pillow" "libavif")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools" "python-pytest-runner")
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("cfab2870325c70f12af1f40b63c5497b97b60c53d5b82196dbb337c4ba0423b1")

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
