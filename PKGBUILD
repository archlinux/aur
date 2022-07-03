# Maintainer: entriphy <t4ils.dev@gmail.com>
# Contributor: Pierre Chapuis <arch@catwell.info>

pkgname=python-airtable-wrapper
_pkgname=pyairtable
pkgver=0.15.3
pkgrel=4
pkgdesc="Python Airtable Client Wrapper"
arch=("any")
url="https://github.com/gtalarico/$_pkgname"
license=("MIT")
options=(!emptydirs)
depends=("python" "python-requests")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools" "python-pytest-runner")
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=("9426679c08d397345179307890e5dde05cfe05b6bf6c7d2b0764806c947ab2c7")

build() {
    cd "$_pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
