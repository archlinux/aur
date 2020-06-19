# Maintainer: Ingo Heimbach <i.heimbach@fz-juelich.de>

pkgname="python-simple-term-menu"
pkgver="0.6.3"
pkgrel="1"
pkgdesc="A Python package which creates simple interactive menus on the command line."
arch=("any")
url="https://github.com/IngoHeimbach/simple-term-menu"
license=("MIT")
depends=("python")
makedepends=("python-setuptools")
source=("https://github.com/IngoHeimbach/simple-term-menu/archive/v${pkgver}.tar.gz")
sha256sums=("ca6e939fdca30892872bedbef86cb42163864d73228214ef8e77705450457ea3")

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
