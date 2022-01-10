# Maintainer: Marcin Kornat <rarvolt@gmail.com>
pkgname=python-barcode
_pkgname=python_barcode
pkgver=0.13.1
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
        "https://files.pythonhosted.org/packages/4e/aa/90966e1caf4d630b2bb420084c9eaa14a7d2ddc8e8a4311cd55ac90753a8/${_pkgname}-${pkgver}-py3-none-any.whl"
    )
noextract=("${pkgname}-${pkgver}-py2.py3-none-any.whl")
sha256sums=('daa32fb999a843812fbb1c75ff909638811af7c465f0a991e9e41d26d2a44a24')

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
