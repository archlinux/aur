# Maintainer: Carl George < arch at cgtx dot us >

pkgname="mkdocs-bootswatch"
pkgver="0.2.0"
pkgrel="1"
pkgdesc="Bootswatch themes for MkDocs"
arch=("any")
url="http://www.mkdocs.org"
license=("BSD")
makedepends=("python-setuptools")
source=("https://pypi.python.org/packages/source/${pkgname:0:1}/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/mkdocs/${pkgname}/${pkgver}/LICENSE")
sha256sums=('0dbb530330eb3838362054b0b49e7c768fd9ebbd59e1048ef01df27a8e000090'
            'ecb1ed9b8c4dea275c07c3ab541835926e83cb46e9815d029b6a171781a0980c')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
