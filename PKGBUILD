# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>

pkgname="python-spectree"
_pkgname="spectree"
pkgver="0.7.2"
pkgrel=1
pkgdesc="API spec validator and OpenAPI document generator for Python web frameworks."
arch=("any")
url="https://github.com/0b01001001/spectree"
source=("https://github.com/0b01001001/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("29b392bf2da8e68d1239e99b18d835f8bff85d9ddb73052a984f38550ef221a5")
license=("Apache-2.0")
depends=("python")
makedepends=("python-setuptools")

build() {
    cd "${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
