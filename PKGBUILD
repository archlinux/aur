# Maintainer: Ingo Heimbach <i.heimbach@fz-juelich.de>

pkgname="python-simple-term-menu"
pkgver="0.5.0"
pkgrel="1"
pkgdesc="A Python package which creates simple interactive menus on the command line."
arch=("any")
url="https://github.com/IngoHeimbach/simple-term-menu"
license=("MIT")
depends=("python")
makedepends=("python-setuptools")
source=("https://github.com/IngoHeimbach/simple-term-menu/archive/v${pkgver}.tar.gz")
sha256sums=("332d5a7b40c35ddb35fb83c215e0c5a2e0e09b17dfa36f9d6acaed67d56b5fe3")

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
