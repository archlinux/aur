# Maintainer: Ingo Heimbach <i.heimbach@fz-juelich.de>

pkgname="python-yacl"
pkgver="0.3.1"
pkgrel="1"
pkgdesc="Yet another color logger for Python."
arch=("any")
url="https://github.com/IngoHeimbach/yacl"
license=("MIT")
depends=("python")
makedepends=("python-setuptools")
source=("https://github.com/IngoHeimbach/yacl/archive/v${pkgver}.tar.gz")
sha256sums=("c91f269d0486c70975fe1c1645c0950aadf1692cac7ea3d7e306ce70d380d2a5")

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
