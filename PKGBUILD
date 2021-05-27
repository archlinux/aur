# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="python-simple-term-menu"
pkgver="1.2.1"
pkgrel="1"
pkgdesc="A Python package which creates simple interactive menus on the command line."
arch=("any")
url="https://github.com/IngoMeyer441/simple-term-menu"
license=("MIT")
depends=("python")
makedepends=("python-setuptools")
source=("https://github.com/IngoMeyer441/simple-term-menu/archive/v${pkgver}.tar.gz")
sha256sums=("b022a45c9dfe3a74a0f3b60b3f124ae09bc9988a16855d06d201bccfffd8057b")

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
