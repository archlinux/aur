# Maintainer: Ariana Gregg <lovetocode999 at tilde dot team>
pkgname=python-makelove
_name="makelove"
pkgver=0.0.6
pkgrel=1
pkgdesc="A packaging tool for löve games"
arch=("x86_64")
url="https://github.com/pfirsich/makelove"
license=("GPL3")
makedepends=("python-setuptools")
depends=("python")
provides=("python-makelove")
conflicts=("python-makelove")
source=("${_name}-${pkgver}.tar.gz::https://github.com/pfirsich/makelove/archive/v${pkgver}.tar.gz")
sha256sums=('de541fed68b4e34d2545f0284ca598cde2f2636c198f9e2bf4095b1d5f3f4817')

build() {
    cd "${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
