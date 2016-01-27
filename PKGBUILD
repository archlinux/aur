# Maintainer: Carl George < arch at cgtx dot us >

pkgname="mkdocs-bootswatch"
pkgver="0.1.0"
pkgrel="1"
pkgdesc="Bootswatch themes for MkDocs"
arch=("any")
url="http://www.mkdocs.org"
license=("BSD")
makedepends=("python-setuptools")
source=(
    "https://pypi.python.org/packages/source/${pkgname:0:1}/${pkgname}/${pkgname}-${pkgver}.tar.gz"
    "https://raw.githubusercontent.com/mkdocs/${pkgname}/${pkgver}/LICENSE"
)
sha256sums=(
    '8123a872ceba41b63c06f6e7adf46d6d8e6ac74d4fc633df1bf01177b0a63e4e'
    'ecb1ed9b8c4dea275c07c3ab541835926e83cb46e9815d029b6a171781a0980c'
)

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
