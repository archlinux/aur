# Maintainer: Marcin Kornat <rarvolt@gmail.com>
pkgname=python-barcode
_pkgname=python_barcode
pkgver=0.14.0
pkgrel=1
pkgdesc="Create standard barcodes with Python. No external modules needed."
arch=('any')
license=('MIT')
conflicts=()
provides=('python-barcode')
url="https://github.com/WhyNotHugo/python-barcode"
depends=('python')
optdepends=('python-pillow: generate images')
makedepends=('python-pip')
source=(
        "https://github.com/WhyNotHugo/${pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-py3-none-any.whl"
    )
noextract=("${pkgname}-${pkgver}-py2.py3-none-any.whl")
sha256sums=('449d4073bfd34f1bb5fa42162356df4550ae7ccf6df3ac34fdb7ab45331921ef')

package() {
    cd "${srcdir}"
    PIP_CONFIG_FILE=/dev/null pip install \
        --no-warn-script-location \
        --isolated \
        --root="${pkgdir}" \
        --ignore-installed \
        --no-deps \
        *.whl
}
