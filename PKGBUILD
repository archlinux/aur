# Maintainer: Ingo Heimbach <i.heimbach@fz-juelich.de>

pkgname="python-simple-term-menu"
pkgver="0.4.2"
pkgrel="1"
pkgdesc="A Python package which creates simple interactive menus on the command line."
arch=("any")
url="https://github.com/IngoHeimbach/simple-term-menu"
license=("MIT")
depends=("python")
makedepends=("python-setuptools")
source=("https://github.com/IngoHeimbach/simple-term-menu/archive/v${pkgver}.tar.gz")
sha256sums=("3587c136dc633baf4d90a9d093f0ce6473df76132f82db6c35b90093f132a7df")

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
