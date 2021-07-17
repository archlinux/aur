# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="python-detect-direct-checkins"
pkgver="0.1.2"
pkgrel="1"
pkgdesc="A utility which detects direct checkins on specific branches."
arch=("any")
url="https://github.com/IngoMeyer441/detect-direct-checkins"
license=("MIT")
depends=("python")
makedepends=("python-setuptools")
source=("https://github.com/IngoMeyer441/detect-direct-checkins/archive/v${pkgver}.tar.gz")
sha256sums=("bb2ba618e4eb5369a54959fbc3fa761a532f2b5fe93885ec9a87ae29d545d085")

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
