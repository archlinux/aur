# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="python-simple-term-menu"
pkgver="0.7.1"
pkgrel="1"
pkgdesc="A Python package which creates simple interactive menus on the command line."
arch=("any")
url="https://github.com/IngoMeyer441/simple-term-menu"
license=("MIT")
depends=("python")
makedepends=("python-setuptools")
source=("https://github.com/IngoMeyer441/simple-term-menu/archive/v${pkgver}.tar.gz")
sha256sums=("ad0db605ba31dfaef43eec2223e27fe2583a3926478589e76adfbbb393822030")

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
