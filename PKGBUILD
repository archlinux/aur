# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="python-simple-term-menu"
pkgver="0.10.1"
pkgrel="1"
pkgdesc="A Python package which creates simple interactive menus on the command line."
arch=("any")
url="https://github.com/IngoMeyer441/simple-term-menu"
license=("MIT")
depends=("python")
makedepends=("python-setuptools")
source=("https://github.com/IngoMeyer441/simple-term-menu/archive/v${pkgver}.tar.gz")
sha256sums=("27214b2e3bff768e5792ad386df693c0d472cd72d63a0cf0a7c4f299ffc468ba")

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
