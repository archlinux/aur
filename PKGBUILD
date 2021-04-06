# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="python-simple-term-menu"
pkgver="1.0.1"
pkgrel="1"
pkgdesc="A Python package which creates simple interactive menus on the command line."
arch=("any")
url="https://github.com/IngoMeyer441/simple-term-menu"
license=("MIT")
depends=("python")
makedepends=("python-setuptools")
source=("https://github.com/IngoMeyer441/simple-term-menu/archive/v${pkgver}.tar.gz")
sha256sums=("cd578cda0acbb37c67502a306045b5bd055ba3ead96b9477a15abcc8904cdc83")

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
