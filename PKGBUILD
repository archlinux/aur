# Contributor: entriphy <t4ils.dev@gmail.com>
# Contributor: Pierre Chapuis <arch@catwell.info>

pkgname=python-airtable-wrapper
_pkgname=pyairtable
pkgver=3.2.0
pkgrel=1
pkgdesc="Python Airtable Client Wrapper"
arch=("any")
url="https://github.com/gtalarico/$_pkgname"
license=("MIT")
options=(!emptydirs)
depends=("python" "python-click" "python-inflection" "python-pydantic" "python-requests" "python-typing_extensions" "python-urllib3")
makedepends=("python-build" "python-installer" "python-setuptools")

source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=("baca26f3b0cc1956b4c0a46aadfc87573b34337a622865a3be9ca4f9f3307c72")

build() {
    cd "$_pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
