# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: entriphy <t4ils.dev@gmail.com>
# Contributor: Pierre Chapuis <arch@catwell.info>

pkgname=python-airtable-wrapper
_pkgname=pyairtable
pkgver=3.3.0
pkgrel=1
pkgdesc="Python Airtable Client Wrapper"
arch=("any")
url="https://github.com/gtalarico/$_pkgname"
license=("MIT")
options=(!emptydirs)
depends=("python" "python-click" "python-inflection" "python-pydantic" "python-requests" "python-typing_extensions" "python-urllib3")
makedepends=("python-build" "python-installer" "python-setuptools")

source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=("56dfb0aa5c5460d1367102826284cc41e29e6a35769c2c9ee78cfed3105348eb")

build() {
    cd "$_pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
