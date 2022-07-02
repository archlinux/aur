# Maintainer: entriphy <t4ils.dev@gmail.com>

pkgname=python-pyairtable
_pkgname=pyairtable
pkgver=1.1.0
pkgrel=1
pkgdesc="Python client for the Airtable API"
arch=("any")
url="https://github.com/gtalarico/$_pkgname"
license=("MIT")
options=(!emptydirs)
depends=("python" "python-requests")
makedepends=("python-setuptools")
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=("b31718b64cd44fd3b1275b78bc3eeb6dd8ca38b0720daac71f734183ea61a5ad")

build() {
    cd "$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
