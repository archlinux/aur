# Maintainer: entriphy <t4ils.dev@gmail.com>

pkgname=python-pyairtable
_pkgname=pyairtable
pkgver=1.3.0
pkgrel=1
pkgdesc="Python client for the Airtable API"
arch=("any")
url="https://github.com/gtalarico/$_pkgname"
license=("MIT")
options=(!emptydirs)
depends=("python" "python-requests")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=("487bcec2309761d869173a19900c43acac03970b68973f88ff1be536a4ecdba7")

build() {
    cd "$_pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
