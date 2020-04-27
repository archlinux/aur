# Maintainer: Ingo Heimbach <i.heimbach@fz-juelich.de>

pkgname="python-simple-term-menu"
pkgver="0.4.5"
pkgrel="2"
pkgdesc="A Python package which creates simple interactive menus on the command line."
arch=("any")
url="https://github.com/IngoHeimbach/simple-term-menu"
license=("MIT")
depends=("python")
makedepends=("python-setuptools")
source=("https://github.com/IngoHeimbach/simple-term-menu/archive/v${pkgver}.tar.gz")
sha256sums=("d61151a6bc16952e0d9e095303c4d632c876706c5ba81a12c7653e266a19d924")

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
