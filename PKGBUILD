# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="python-detect-direct-checkins"
pkgver="0.1.1"
pkgrel="1"
pkgdesc="A utility which detects direct checkins on specific branches."
arch=("any")
url="https://github.com/IngoMeyer441/detect-direct-checkins"
license=("MIT")
depends=("python")
makedepends=("python-setuptools")
source=("https://github.com/IngoMeyer441/detect-direct-checkins/archive/v${pkgver}.tar.gz")
sha256sums=("052a8f371989136bba257721dae232d00d1a9ad7678d4126eacd3abf266b6fca")

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
