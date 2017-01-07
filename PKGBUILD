# Maintainer: Carl George < arch at cgtx dot us >

pkgname="mkdocs-bootstrap"
pkgver="0.1.1"
pkgrel="2"
pkgdesc="Bootstrap theme for MkDocs"
arch=("any")
url="http://www.mkdocs.org"
license=("BSD")
makedepends=("python-setuptools")
source=(
    "https://pypi.python.org/packages/source/${pkgname:0:1}/${pkgname}/${pkgname}-${pkgver}.tar.gz"
    "https://raw.githubusercontent.com/mkdocs/${pkgname}/${pkgver}/LICENSE"
)
sha256sums=(
    '15084a6be59393fe5ecb9f04d09e674337a69fbd1e6ec5d9328e606a6c6cab36'
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
