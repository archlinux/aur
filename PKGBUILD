# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>

_pkgname=weblate_schemas
pkgname=python-weblate_schemas
pkgver=0.5
pkgrel=1
pkgdesc="Schemas used in Weblate"
url="https://github.com/WeblateOrg/weblate_schemas"
depends=('python' 'python-jsonschema')
checkdepends=('python-pytest')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://github.com/WeblateOrg/${_pkgname}/archive/${pkgver}.tar.gz")

sha256sums=('bf5a610a7d6498bb76b29b9690c3dc69d659780c167e40f7ba2beedec4afcef1')

check() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    pytest
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
