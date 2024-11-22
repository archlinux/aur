# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="python-yacl"
pkgver="0.6.0"
pkgrel="1"
pkgdesc="Yet another color logger for Python."
arch=("any")
url="https://github.com/IngoMeyer441/yacl"
license=("MIT")
depends=("python" "python-pygments")
makedepends=("python-setuptools")
source=("https://github.com/IngoMeyer441/yacl/archive/v${pkgver}.tar.gz")
sha256sums=("09aafbc2a5daa312f4b5aece4950939ef7bd6db4d2b9a569014e1d7e0484c7fb")

build() {
    cd "${srcdir}/${pkgname#*-}-${pkgver}" || return
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname#*-}-${pkgver}" || return
    python setup.py install --optimize=1 \
                            --prefix=/usr \
                            --root="${pkgdir}" \
                            --skip-build
}
