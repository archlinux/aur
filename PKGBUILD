# Maintainer: entriphy <t4ils.dev@gmail.com>

pkgname=python-pyairtable
_pkgname=pyairtable
pkgver=2.2.1
pkgrel=1
pkgdesc="Python client for the Airtable API"
arch=("any")
url="https://github.com/gtalarico/$_pkgname"
license=("MIT")
options=(!emptydirs)
depends=("python" "python-requests")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=("c78638150ee657eef599562e921e0ba5699fb2a60196369f4445eab2d34c8b00")

build() {
    cd "$_pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
