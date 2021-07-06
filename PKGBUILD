# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="python-yacl"
pkgver="0.4.2"
pkgrel="1"
pkgdesc="Yet another color logger for Python."
arch=("any")
url="https://github.com/IngoMeyer441/yacl"
license=("MIT")
depends=("python" "python-pygments")
makedepends=("python-setuptools")
source=("https://github.com/IngoMeyer441/yacl/archive/v${pkgver}.tar.gz")
sha256sums=("4589c9b53e9ad5d63df3342f1eabef524a411ace0d9155ab0b067e217e84f8a6")

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
