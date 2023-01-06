# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="python-simple-term-menu"
pkgver="1.6.0"
pkgrel="1"
pkgdesc="A Python package which creates simple interactive menus on the command line."
arch=("any")
url="https://github.com/IngoMeyer441/simple-term-menu"
license=("MIT")
depends=("python")
makedepends=("python-setuptools")
source=("https://github.com/IngoMeyer441/simple-term-menu/archive/v${pkgver}.tar.gz")
sha256sums=("1c5a553064a93bb80b5ce6202c196842521d64e49a172b653a55802c8c90658d")

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
