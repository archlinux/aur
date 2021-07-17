# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="python-detect-direct-checkins"
pkgver="0.1.0"
pkgrel="1"
pkgdesc="A utility which detects direct checkins on specific branches."
arch=("any")
url="https://github.com/IngoMeyer441/detect-direct-checkins"
license=("MIT")
depends=("python")
makedepends=("python-setuptools")
source=("https://github.com/IngoMeyer441/detect-direct-checkins/archive/v${pkgver}.tar.gz")
sha256sums=("3c8a35072890b3c55ab40aa318f4a107ad5bc61381538524e16d65f2db13e4b2")

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
